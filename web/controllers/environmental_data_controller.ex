defmodule Cyanometer.EnvironmentalDataController do
  use Cyanometer.Web, :controller
  require Logger

  alias Cyanometer.EnvironmentalData

  plug :scrub_params, "environmental_data" when action in [:create, :update]

  def index(conn, %{"location_id" => location_id} = params) do
    environmental_datas = Repo.all(from ed in EnvironmentalData,
                                   where: ed.location_id == ^location_id,
                                   limit: 24,
                                   order_by: [desc: ed.taken_at])
    json(conn, environmental_datas)
  end

  def show(conn, %{"id" => id}) do
    environmental_data = Repo.get!(EnvironmentalData, id)
    render(conn, "show.json", environmental_data: environmental_data)
  end


  def create(conn, %{"environmental_data" => ed_params}) do
    changeset = EnvironmentalData.changeset(%EnvironmentalData{}, ed_params)

    case Repo.insert(changeset) do
      {:ok, environmental_data} ->
        conn
          |> put_status(:created)
          |> put_resp_header("location", environmental_data_path(conn, :show, environmental_data))
          |> render("show.json", environmental_data: environmental_data)
      {:error, changeset} ->
        conn
          |> put_status(:unprocessable_entity)
          |> render(Cyanometer.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "environmental_data" => ed_params}) do
    ed = Repo.get!(EnvironmentalData, id)
    changeset = EnvironmentalData.changeset(ed, ed_params)

    case Repo.update(changeset) do
      {:ok, ed} ->
        render(conn, "show.json", environmental_data: ed)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Cyanometer.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    ed = Repo.get!(EnvironmentalData, id)
    Repo.delete!(ed)

    send_resp(conn, :no_content, "")
  end
end
