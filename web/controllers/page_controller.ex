defmodule Cyanometer.PageController do
  use Cyanometer.Web, :controller
  alias Cyanometer.Image

  def index(conn, _params) do
    images = Repo.all(Image)
    render conn, "index.html", images: images
  end

end
