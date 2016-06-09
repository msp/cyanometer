defmodule Cyanometer.PageController do
  use Cyanometer.Web, :controller
  alias Cyanometer.Image

  def index(conn, _params) do
    images = Repo.all(from image in Image, limit: 50, order_by: [desc: image.taken_at])
    render conn, "index.html", images: images
  end

end
