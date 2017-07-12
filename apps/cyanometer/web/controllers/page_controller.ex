defmodule Cyanometer.PageController do
  use Cyanometer.Web, :controller
  alias Cyanometer.Image
  alias Cyanometer.Location

  plug :assign_debug

  def index(conn, _params) do
    render conn, "index.html"
  end

  def location(conn, %{"id" => location_id}) do
    location = Repo.one!(from location in Location, where: location.id == ^location_id)
    render conn, "location.html", location: location
  end

  def test(conn, _params) do
    conn
      # |> put_layout("vanilla.html")
      |> render("test.html")
  end

  defp assign_debug(conn, _) do
    assign(conn, :debug, Map.get(conn.params, "debug", false))
  end
end
