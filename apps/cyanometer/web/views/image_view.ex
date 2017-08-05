defmodule Cyanometer.ImageView do
  use Cyanometer.Web, :view

  def render("index.json", %{images: images}) do
    render_many(images, Cyanometer.ImageView, "image.json")
  end

  def render("landing.json", %{images: images}) do
    render_many(images, Cyanometer.ImageView, "landing_image.json")
  end

  def render("show.json", %{image: image}) do
    render_one(image, Cyanometer.ImageView, "image.json")
  end

  def render("image.json", %{image: image}) do
    basics_from(image)
  end

  def render("landing_image.json", %{image: image}) do
    Map.merge(basics_from(image), %{location: location_summary_from(image)})
  end

  def basics_from(image) do
    %{id: image.id,
      s3_url: image.s3_url,
      taken_at: image.taken_at,
      blueness_index: image.blueness_index,
      location_id: image.location_id}
  end

  def location_summary_from(image) do
    "#{image.location.city}, #{image.location.country}"
  end
end
