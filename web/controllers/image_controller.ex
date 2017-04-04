defmodule Cyanometer.ImageController do
  use Cyanometer.Web, :controller
  require Logger

  alias Cyanometer.Image
  alias Cyanometer.EnvironmentalData
  alias Cyanometer.Location

  plug :scrub_params, "image" when action in [:create, :update]

  # API ########################################################################
  def index(conn, %{"location_id" => location_id} = params) do
    start_date = get_or_default_start_date_from params

    images = Repo.all(from image in Image,
                      where: image.taken_at <= ^start_date,
                      where: image.location_id == ^location_id,
                      limit: 24,
                      order_by: [desc: image.taken_at])

    render(conn, "index.json", images: images)
  end

  def landing(conn, %{"count" => count}) do
    locations = Repo.all(from location in Location, preload: [:images])
    location_groups = Enum.group_by(locations, fn(l) -> l.id end)
    location_ids = Map.keys(location_groups)

    location_image_groups =
      Enum.map(location_ids, fn(lid) ->
        images_for_location =
          Map.get_and_update!(location_groups, lid, fn(current) ->
            {lid, Enum.at(current,0).images}
          end)

        {lid, Map.get(Enum.at(Tuple.to_list(images_for_location),1), lid)}
      end)

    index = 0
    total_required =
      try do
        String.to_integer(count)
      catch
        :error ->
          3
      end

    images = Image.collect_images_from(location_image_groups, index, total_required, [])
    images = Enum.sort(images, &(&1.taken_at > &2.taken_at))

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


  # HTML #######################################################################
  def debug(conn, _params) do
    images = Repo.all(from image in Image, limit: 300,
                      order_by: [desc: image.taken_at])

    environmental_datas = Repo.all(from ed in EnvironmentalData, limit: 24,
                                   order_by: [desc: ed.taken_at])
    conn
      |> put_layout("vanilla.html")
      |> render("debug.html", images: images, environmental_datas: environmental_datas)

  end

  # PRIV #######################################################################
  defp get_or_default_start_date_from(params) do
    if (params["year"] && params["month"] && params["day"]) do
      year  = String.to_integer(params["year"])
      month = String.to_integer(params["month"])
      day   = String.to_integer(params["day"])

      Ecto.DateTime.from_erl({ {year, month, day}, {23,59,0} })
    else
      Ecto.DateTime.utc
    end
  end
end
