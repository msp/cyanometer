defmodule Cyanometer.MeasurementsController do
  use Cyanometer.Web, :controller

  @measurements_service Application.get_env(:cyanometer, Cyanometer.Endpoint)[:measurements_service]

  @known_locations [{~r/ljubljana/i, :ljubljana}, {~r/wroclaw/i, :wroclaw}]

  def measurements(conn, %{"location" => location}) do
    measurements = location |> parse |> get_measurements
    render(conn, "measurements.json", measurements: measurements)
  end

  defp get_measurements({:ljubljana, _loc}), do: @measurements_service.ljubljana
  defp get_measurements({:unknown, _loc}), do: @measurements_service.unknown

  defp parse(loc) do
    {_, type} = Enum.find(@known_locations, {nil, :unknown}, fn {reg, _type} ->
       String.match?(loc, reg)
     end)
    {type, loc}
  end
end
