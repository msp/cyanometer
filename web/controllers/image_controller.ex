defmodule Cyanometer.ImageController do
  use Cyanometer.Web, :controller
  require Logger

  alias Cyanometer.Image
  alias Cyanometer.EnvironmentalData

  plug :scrub_params, "image" when action in [:create, :update]

  # API
  def index(conn, params) do
    start_date =
      if (params["year"] && params["month"] && params["day"]) do
        year  = String.to_integer(params["year"])
        month = String.to_integer(params["month"])
        day   = String.to_integer(params["day"])

        IO.puts "d,m,y : #{day} #{month} #{year}"
        Ecto.DateTime.from_erl({ {year, month, day}, {23,59,0} })
      else
        Ecto.DateTime.utc
      end

    images = Repo.all(from image in Image,
                      where: image.taken_at <= ^start_date,
                      limit: 24,
                      order_by: [desc: image.taken_at])

    render(conn, "index.json", images: images)
  end

  def show(conn, %{"id" => id}) do
    image = Repo.get!(Image, id)
    render(conn, "show.json", image: image)
  end

  def create(conn, %{"image" => image_params}) do
    changeset = Image.changeset(%Image{}, image_params)

    case Repo.insert(changeset) do
      {:ok, image} ->
        conn
          |> put_status(:created)
          |> put_resp_header("location", image_path(conn, :show, image))
          |> render("show.json", image: image)
      {:error, changeset} ->
        conn
          |> put_status(:unprocessable_entity)
          |> render(Cyanometer.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "image" => image_params}) do
    image = Repo.get!(Image, id)
    changeset = Image.changeset(image, image_params)

    case Repo.update(changeset) do
      {:ok, image} ->
        render(conn, "show.json", image: image)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Cyanometer.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    image = Repo.get!(Image, id)
    Repo.delete!(image)

    send_resp(conn, :no_content, "")
  end


  # HTML
  def debug(conn, _params) do
    images = Repo.all(from image in Image, limit: 300,
                      order_by: [desc: image.taken_at])

    environmental_datas = Repo.all(from ed in EnvironmentalData, limit: 24,
                                   order_by: [desc: ed.taken_at])
    conn
      |> put_layout("vanilla.html")
      |> render("debug.html", images: images, environmental_datas: environmental_datas)

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
