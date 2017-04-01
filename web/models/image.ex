defmodule Cyanometer.Image do
  use Cyanometer.Web, :model

  @derive {Poison.Encoder, only: [:id, :s3_url, :taken_at, :blueness_index, :location_id]}
  schema "images" do
    field :s3_url, :string
    field :taken_at, Ecto.DateTime
    field :blueness_index, :string

    belongs_to :location, Cyanometer.Location

    timestamps()
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:s3_url, :taken_at, :blueness_index, :location_id])
    |> validate_required([:s3_url, :taken_at, :blueness_index, :location_id])
    |> unique_constraint(:s3_url)
    |> unique_constraint(:taken_at)
    |> validate_length(:s3_url, min: 9, max: 200)
    |> validate_length(:blueness_index, min: 1, max: 20)
    |> validate_url(:s3_url)
    |> validate_s3_host(:s3_url)
    |> validate_s3_bucket(:s3_url)
  end

  def migrate_url_changeset(model, params \\ %{}) do
    model
    |> changeset(params)
    |> migrate_url(:s3_url, Application.fetch_env!(:cyanometer_migrator, :source_bucket),
                            Application.fetch_env!(:cyanometer_migrator, :country),
                            Application.fetch_env!(:cyanometer_migrator, :city),
                            Application.fetch_env!(:cyanometer_migrator, :place))
  end

  def migrate_url(changeset, field, s3_bucket, country, city, place) do
    url = get_field(changeset, field)
    put_change(changeset, :s3_url, Migrator.S3.namespace_url(s3_bucket, country, city, place, url))
  end

  def validate_url(changeset, field, options \\ []) do
    validate_change changeset, field, fn _, url ->
      case url |> String.to_char_list |> :http_uri.parse do
        {:ok, _} -> []
        {:error, msg} -> [{field, options[:message] || "invalid url: #{inspect msg}"}]
      end
    end
  end

  def validate_s3_host(changeset, field) do
    url = get_field(changeset, field)

    if (url && String.length(url) > 0) do
      uri = URI.parse(url)

      case uri.host do
        "s3.eu-central-1.amazonaws.com" -> changeset
        _ -> add_error(changeset, field, "Not our S3 host: #{url}")
      end
    else
      changeset
    end
  end

  def validate_s3_bucket(changeset, field) do
    url = get_field(changeset, field)

    if (url && String.length(url) > 0) do
      uri = URI.parse(url)
      paths = String.split(uri.path, "/")

      case Enum.at(paths, 1) do
        "cyanometer" -> changeset
        _ -> add_error(changeset, field, "Not our S3 host (invalid bucket): #{url} #{inspect paths}")
      end
    else
      changeset
    end
  end
end
