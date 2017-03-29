defmodule Cyanometer.LocationView do
  use Cyanometer.Web, :view

  def render("index.json", %{locations: locations}) do
    render_many(locations, Cyanometer.LocationView, "location.json")
  end

  def render("show.json", %{location: location}) do
    render_one(location, Cyanometer.LocationView, "location.json")
  end

  def render("location.json", %{location: location}) do
    %{id: location.id,
      country: location.country,
      city: location.city,
      place: location.place}
  end
end
