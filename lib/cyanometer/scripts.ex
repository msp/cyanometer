defmodule Cyanometer.Scripts do
  require Logger

  @source_bucket Application.fetch_env!(:cyanometer_migrator, :source_bucket)
  @target_bucket Application.fetch_env!(:cyanometer_migrator, :target_bucket)
  @country       Application.fetch_env!(:cyanometer_migrator, :country)
  @city          Application.fetch_env!(:cyanometer_migrator, :city)
  @place         Application.fetch_env!(:cyanometer_migrator, :place)
  @image_content "foo bar baz"

  @doc """
  `export AWS_ACCESS_KEY_ID=123 AWS_SECRET_ACCESS_KEY=asdf && mix run -e Cyanometer.Scripts.migrate_s3 `

  Copy the source_bucket to the target_bucket, namespacing the objects and update our local DB
  """
  def migrate_s3 do
    IO.puts "-------------------------------------------------------------------"
    IO.puts "[#{Mix.env}] STARTING: migrate_s3...\n"
    IO.puts "#{@source_bucket} -> #{@target_bucket}: #{@country}, #{@city}, #{@place}"
    IO.puts "-------------------------------------------------------------------"

    backup = "create table images_bak_#{:os.system_time(:millisecond)} as select * from images"
    Ecto.Adapters.SQL.query(Cyanometer.Repo, backup, [])
    Logger.info "Created table backup: #{backup}"

    Cyanometer.Repo.all(Cyanometer.Image)
    |> Enum.map(fn (image) ->
      new_s3_url = Migrator.S3.namespace_url("cyanometer", @target_bucket, @country, @city, @place, image.s3_url)

      old_s3_key =
        URI.parse(image.s3_url).path
        |> String.replace("/cyanometer/", "")

      new_s3_key =
        URI.parse(new_s3_url).path
        |> String.replace("/#{@target_bucket}/", "")


      if new_s3_key != "" do
        copy_res = Migrator.S3.copy(@source_bucket, old_s3_key, @target_bucket, new_s3_key)

        case copy_res.status_code do
          200 -> Cyanometer.Image.changeset(image, %{s3_url: new_s3_url})
                 |> Cyanometer.Repo.update()
          _   -> Logger.warn("Failed  to copy/update [#{image.id}]: #{old_s3_key}")
        end
      end
    end)
  end

  @doc """
  `export AWS_ACCESS_KEY_ID=123 AWS_SECRET_ACCESS_KEY=asdf && mix run -e Cyanometer.Scripts.test_populate_s3 `

  TESTING ONLY!
  Populate our local fakes3 with a bunch of objects we can test `migrate_s3` against
  """
  def test_populate_s3 do
    IO.puts "-------------------------------------------------------------------"
    IO.puts "[#{Mix.env}] STARTING: test_populate_s3...\n"
    IO.puts "#{@source_bucket} -> #{@target_bucket}: #{@country}, #{@city}, #{@place}"
    IO.puts "-------------------------------------------------------------------"

    images = Cyanometer.Repo.all(Cyanometer.Image)
    IO.puts "Found: #{Enum.count(images)} images"

    images
    |> Enum.each(fn(image) ->
                  uri = URI.parse(image.s3_url)
                  key = String.replace(uri.path, "/cyanometer/", "")
                  IO.inspect key
                  ExAws.S3.put_object(@source_bucket, key, @image_content)
                  |> ExAws.request!
                 end)
  end

  @doc """
  `export AWS_ACCESS_KEY_ID=123 AWS_SECRET_ACCESS_KEY=asdf && mix run -e Cyanometer.Scripts.test_cleanup_s3 `

  TESTING ONLY!
  Clean our local fakes3 objects
  """
  def test_cleanup_s3 do
    IO.puts "-------------------------------------------------------------------"
    IO.puts "[#{Mix.env}] STARTING: test_cleanup_s3...\n"
    IO.puts "#{@target_bucket}"
    IO.puts "-------------------------------------------------------------------"

    items = ExAws.S3.list_objects(@target_bucket) |> ExAws.request!
    Logger.info "Found: #{Enum.count(items.body.contents)}"

    if Enum.count(items.body.contents) > 0 do
      items.body.contents
      |> Enum.each(fn(item) ->
                    IO.puts "Removing: #{item.key}"
                    ExAws.S3.delete_object(@target_bucket, item.key)
                      |> ExAws.request!
                   end)

      ExAws.S3.delete_bucket(@target_bucket) |> ExAws.request

    else
      Logger.warn "---------------------------------------> Nothing to clean up!"
      IO.inspect items
    end
  end

  @doc """
  `export AWS_ACCESS_KEY_ID=123 AWS_SECRET_ACCESS_KEY=asdf && mix run -e Cyanometer.Scripts.test_verify_s3 `

  Verify all images in the DB have a corresponding S3 item
  """
  def test_verify_s3 do
    IO.puts "-------------------------------------------------------------------"
    IO.puts "[#{Mix.env}] STARTING: test_verify_s3...\n"
    IO.puts "#{@target_bucket}: #{@country}, #{@city}, #{@place}"
    IO.puts "-------------------------------------------------------------------"

    all_images = Cyanometer.Repo.all(Cyanometer.Image)

    all_images
    |> Enum.map(fn (image) ->
      uri = URI.parse(image.s3_url)

      s3_key =
        URI.parse(uri.path).path
        |> String.replace(@target_bucket, "")

      try do
        get_res = ExAws.S3.get_object(@target_bucket, s3_key) |> ExAws.request!

      catch
        :error, result ->
          Logger.warn("Mismatch, no object in S3 for [#{image.s3_url}]")
      end
    end)

    Logger.warn("Total images in DB: #{Enum.count(all_images)}")
  end
end
