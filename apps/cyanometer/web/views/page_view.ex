defmodule Cyanometer.PageView do
  use Cyanometer.Web, :view

  def location_host(location) do
    uri = URI.parse(location.air_quality_link)
    uri.host
  end

end
