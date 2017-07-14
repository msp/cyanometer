defmodule Cyanometer.MeasurementsController do
  use Cyanometer.Web, :controller

  @known_locations [{~r/ljubljana/i, :ljubljana}, {~r/wroclaw/i, :wroclaw}]

  def measurements(conn, %{"location" => location}) do
    measurements = location |> parse |> get_measurements
    render(conn, "measurements.json", measurements: measurements)
  end

  defp get_measurements({:ljubljana, loc}), do: Measurements.ljubljana
  defp get_measurements({:unknown, loc}), do: Measurements.unknown

  defp parse(loc) do
    {_, type} = Enum.find(@known_locations, {nil, :unknown}, fn {reg, type} ->
       String.match?(loc, reg)
     end)
    {type, loc}
  end
end
