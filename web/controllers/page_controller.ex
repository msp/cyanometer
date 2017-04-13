defmodule Cyanometer.PageController do
  use Cyanometer.Web, :controller
  alias Cyanometer.Image

  plug :assign_debug

  def index(conn, _params) do
    render conn, "index.html"
  end

  def location(conn, _params) do
    images = Repo.all(from image in Image, limit: 50, order_by: [desc: image.taken_at])
    render conn, "location.html", images: images
  end

  def archive(conn, _params) do
    render conn, "archive.html"
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
