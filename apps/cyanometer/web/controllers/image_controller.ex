defmodule Cyanometer.ImageController do
  use Cyanometer.Web, :controller
  require Logger

  alias Cyanometer.Image
  alias Cyanometer.EnvironmentalData
  alias Cyanometer.Location

  plug :scrub_params, "image" when action in [:create, :update]

  @max_records 5000

  # API ########################################################################
  def index(conn, %{"location_id" => location_id} = params) do
    end_date    = get_or_default_end_date_from params
    start_date  = get_or_default_start_date_from params
    count       = get_or_default_count_from params

    images = Repo.all(from image in Image,
                      where: image.taken_at >= ^start_date,
                      where: image.taken_at <= ^end_date,
                      where: image.location_id == ^location_id,
                      limit: ^count,
                      order_by: [desc: image.taken_at])

    render(conn, "index.json", images: images)
  end

  def landing(conn, %{"count" => count}) do
    locations = Repo.all(from location in Location)
    location_groups =
      Enum.group_by(locations,
        fn(l) -> l.id end,
        fn(li) ->
          Repo.all(from image in Image,
                   where: image.location_id == ^li.id,
                   limit: 50,
                   order_by: [desc: image.taken_at],
                   preload: :location)
        end
      )

    flat_location_groups =
      location_groups
      |> Enum.map(fn{k, v} -> {k,  Enum.at(v, 0)} end )
      |> Enum.into(%{})

    index = 0
    total_required =
      try do
        String.to_integer(count)
      catch
        :error ->
          3
      end

    images = Image.collect_images_from(flat_location_groups, index, total_required, [])
    images = Enum.sort(images, &(&1.taken_at > &2.taken_at))

    render(conn, "landing.json", images: images)
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
    locations = Repo.all(from location in Location, order_by: [desc: location.id])

    location_images =
      Enum.map(locations, fn(location) ->
        Repo.all(from image in Image,
          join: l in assoc(image, :location),
          where: image.location_id == ^location.id,
          limit: 300,
          order_by: [desc: image.taken_at],
          preload: [location: l]
          )
      end)

    location_environmental_datas =
      Enum.map(locations, fn(location) ->
        Repo.all(from ed in EnvironmentalData,
          join: l in assoc(ed, :location),
          where: ed.location_id == ^location.id,
          limit: 24,
          order_by: [desc: ed.taken_at],
          preload: [location: l]
          )
      end)

    conn
      |> put_layout("vanilla.html")
      |> render("debug.html",
        locations: locations,
        location_images: location_images,
        location_environmental_datas: location_environmental_datas)

  end

  # PRIV #######################################################################
  defp get_or_default_end_date_from(%{"year" => year, "month" => month, "day" => day}) do
    if year && month && day do
      Ecto.DateTime.from_erl({ {year |> String.to_integer,
                                month |> String.to_integer,
                                day |> String.to_integer}, {23,59,59} })
    end
  end

  defp get_or_default_end_date_from(_params) do
    Ecto.DateTime.utc
  end

  defp get_or_default_start_date_from(%{"syear" => year, "smonth" => month, "sday" => day}) do
    if year && month && day do
      Ecto.DateTime.from_erl({ {year |> String.to_integer,
                                month |> String.to_integer,
                                day |> String.to_integer}, {00,00,00} })
    end
  end

  defp get_or_default_start_date_from(_params) do
    Ecto.DateTime.from_erl({ {2016, 1, 1}, {00,00,00} })
  end

  defp get_or_default_count_from(%{"count" => count}) do
    num_count = count |> String.to_integer
    if num_count < @max_records do
      num_count
    else
      @max_records
    end
  end

  defp get_or_default_count_from(_params) do
    24
  end
end
