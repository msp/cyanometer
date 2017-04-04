defmodule Cyanometer.PageController do
  use Cyanometer.Web, :controller
  alias Cyanometer.Image

  def index(conn, params) do
    debug = Map.get(params, "debug", false)
    render conn, "index.html", debug: debug
  end

  def location(conn, params) do
    debug = Map.get(params, "debug", false)
    images = Repo.all(from image in Image, limit: 50, order_by: [desc: image.taken_at])
    render conn, "location.html", images: images, debug: debug
  end

  def test(conn, _params) do
    conn
      # |> put_layout("vanilla.html")
      |> render("test.html")
  end

end
