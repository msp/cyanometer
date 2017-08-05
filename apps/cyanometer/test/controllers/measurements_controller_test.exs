defmodule MeasurementsMock do
  def ljubljana do
    %{ozone: "lju-oz-10", particles: "lju-par-20", sulphite: "lju-sul-30", nitrogen: "lju-nit-40"}
  end

  def wroclaw do
    %{ozone: "wro-oz-10", particles: "wro-par-20", sulphite: "wro-sul-30", nitrogen: "wro-nit-40"}
  end

  def unknown do
    %{ozone: "??", particles: "??", sulphite: "??", nitrogen: "??"}
  end
end

defmodule Cyanometer.MeasurementsControllerTest do
  use Cyanometer.ConnCase

  test "GET /api/measurements?location=ljubljana", %{conn: conn} do
    url = measurements_path(conn, :measurements, location: "ljubljana")

    conn =
      conn
      |> get(url)

    assert Poison.encode!(json_response(conn, 200)) == Poison.encode!(MeasurementsMock.ljubljana)
  end

  test "GET /api/measurements?location=wroclaw", %{conn: conn} do
    url = measurements_path(conn, :measurements, location: "wroclaw")

    conn =
      conn
      |> get(url)

    assert Poison.encode!(json_response(conn, 200)) == Poison.encode!(MeasurementsMock.wroclaw)
  end

  test "GET /api/measurements?location=unknown-location", %{conn: conn} do
    url = measurements_path(conn, :measurements, location: "unknown-location")

    conn =
      conn
      |> get(url)

    assert Poison.encode!(json_response(conn, 200)) == Poison.encode!(MeasurementsMock.unknown)
  end
end
