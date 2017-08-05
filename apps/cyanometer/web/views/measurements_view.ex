defmodule Cyanometer.MeasurementsView do
  use Cyanometer.Web, :view

  def render("measurements.json", %{measurements: measurements}) do
    basics_from(measurements)
  end

  def basics_from(measurements) do
    %{ozone: to_string(measurements.ozone),
      particles: to_string(measurements.particles),
      sulphite: to_string(measurements.sulphite),
      nitrogen: to_string(measurements.nitrogen)}
  end
end
