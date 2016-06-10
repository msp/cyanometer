defmodule Cyanometer.PageController do
  use Cyanometer.Web, :controller
  alias Cyanometer.Image

  def index(conn, params) do
    debug = Dict.get(params, "debug", false)
    images = Repo.all(from image in Image, limit: 50, order_by: [desc: image.taken_at])
    render conn, "index.html", images: images, debug: debug
  end

  def test(conn, _params) do
    conn
      # |> put_layout("vanilla.html")
      |> render("test.html")
  end

end
