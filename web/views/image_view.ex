defmodule Cyanometer.ImageView do
  use Cyanometer.Web, :view

  def render("index.json", %{images: images}) do
    render_many(images, Cyanometer.ImageView, "image.json")
  end

  def render("show.json", %{image: image}) do
    render_one(image, Cyanometer.ImageView, "image.json")
  end

  def render("image.json", %{image: image}) do
    %{id: image.id,
      s3_url: image.s3_url,
      taken_at: image.taken_at,
      blueness_index: image.blueness_index}
  end
end
