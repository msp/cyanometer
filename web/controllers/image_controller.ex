defmodule Cyanometer.ImageController do
  use Cyanometer.Web, :controller
  require Logger
  alias Cyanometer.Image
  alias Cyanometer.EnvironmentalData

  def index(conn, params) do
    if (params["year"] && params["month"] && params["day"]) do
      year  = String.to_integer(params["year"])
      month = String.to_integer(params["month"])
      day   = String.to_integer(params["day"])

      IO.puts "d,m,y : #{day} #{month} #{year}"
      start_date = Ecto.DateTime.from_erl({ {year, month, day}, {23,59,0} })
    else
      start_date = Ecto.DateTime.utc
    end

    IO.puts "%%%%%%%%%%%%%%%%%%%%%%%%%  start_date: #{start_date}"
    IO.puts inspect(params)

    images = Repo.all(from image in Image,
                      # where: image.id == 64,
                      where: image.taken_at <= ^start_date,
                      limit: 24,
                      order_by: [desc: image.taken_at])

    IO.puts "images: +++++++++++++++++++++++++++++++++++++ #{Enum.count images}"
    Enum.map(images, fn(image) -> IO.puts "#{image.id} - #{image.taken_at}" end)
    json(conn, images)
  end

  def debug(conn, _params) do
    images = Repo.all(from image in Image, limit: 24,
                      order_by: [desc: image.taken_at])

    environmental_datas = Repo.all(from ed in EnvironmentalData, limit: 24,
                                   order_by: [desc: ed.taken_at])
    conn
      |> put_layout("vanilla.html")
      |> render("debug.html", images: images, environmental_datas: environmental_datas)

  end

  def create(conn, params) do
    Logger.debug "MSP create [#{params["taken_at"]}]"
    Logger.debug "MSP create [#{params["s3_url"]}]"
    Logger.debug "MSP create [#{params["blueness_index"]}]"
    Logger.debug "MSP create [#{params["air_pollution_index"]}]"
    Logger.debug "MSP create [#{params["icon"]}]"

    changeset = Image.changeset(%Image{}, params)

    case Repo.insert(changeset) do
      {:ok, image} ->
        Logger.debug "OK"
        json(conn, %{status: "ok", message: "inserted #{image.s3_url} sucessfully"})
      {:error, changeset} ->
        Logger.debug "ERROR changeset valid? #{changeset.valid?}"

        errors = Enum.map(changeset.errors, fn {field, detail} ->
          %{
            source: %{ pointer: "/data/attributes/#{field}" },
            title: "Invalid Attribute",
            detail: render_detail(detail)
          }
        end)
        json(conn, %{status: "error", detail: errors})
    end
  end

  def render_detail({message, values}) do
    Enum.reduce values, message, fn {k, v}, acc ->
      String.replace(acc, "%{#{k}}", to_string(v))
    end
  end

  def render_detail(message) do
    message
  end
end
