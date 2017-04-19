defmodule Cyanometer.EnvironmentalDataView do
  use Cyanometer.Web, :view

  def render("index.json", %{environmental_datas: environmental_datas}) do
    render_many(environmental_datas, Cyanometer.EnvironmentalDataView, "environmental_data.json")
  end

  def render("show.json", %{environmental_data: environmental_data}) do
    render_one(environmental_data, Cyanometer.EnvironmentalDataView, "environmental_data.json")
  end

  def render("environmental_data.json", %{environmental_data: environmental_data}) do
    %{id: environmental_data.id,
      air_pollution_index: environmental_data.air_pollution_index,
      icon: environmental_data.icon,
      taken_at: environmental_data.taken_at,
      location_id: environmental_data.location_id}
  end
end
