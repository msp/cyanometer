defmodule WroclawTest do
  use ExUnit.Case
  doctest Wroclaw

  @request_path "/dane-pomiarowe/api/automatyczne/stacja/DOL012/12O3_43I-12SO2_43I-12NO2A-12PM10/dzienny/2016-07-27"

  setup do
    bypass = Bypass.open
    {:ok, bypass: bypass}
  end


  test "fetch with a valid response", %{bypass: bypass} do
    Bypass.expect_once bypass, "GET", @request_path, fn conn ->
      conn
      |> Plug.Conn.put_resp_header("Content-Type", "application/json")
      |> Plug.Conn.resp(200, valid_json_response())
    end

    assert Wroclaw.fetch(endpoint_url(bypass.port) <> @request_path) == valid_json_response()
  end

  test "fetch with a 404", %{bypass: bypass} do
    Bypass.expect_once bypass, "GET", "/some-bad-wro-path", fn conn ->
      conn
      |> Plug.Conn.put_resp_header("Content-Type", "text/html")
      |> Plug.Conn.resp(404, ~s(<html><body><h1>Page not found</h1></body></html>))
    end

    assert Wroclaw.fetch(endpoint_url(bypass.port) <> "/some-bad-wro-path") == Utils.empty_json
  end

  test "fetch with a 500", %{bypass: bypass} do
    Bypass.expect_once bypass, "GET", "/wro-will-asplode", fn conn ->
      conn
      |> Plug.Conn.put_resp_header("Content-Type", "text/html")
      |> Plug.Conn.resp(500, ~s(<html><body><h1>Internal server error</h1></body></html>))
    end

    assert Wroclaw.fetch(endpoint_url(bypass.port) <> "/wro-will-asplode") == Utils.empty_json
  end

  test "fetch with an invalid Content-Type", %{bypass: bypass} do
    Bypass.expect_once bypass, "GET", @request_path, fn conn ->
      conn
      |> Plug.Conn.put_resp_header("Content-Type", "text/html")
      |> Plug.Conn.resp(200, ~s(<html><body><h1>What even is this?</h1></body></html>))
    end

    assert Wroclaw.fetch(endpoint_url(bypass.port) <> @request_path) == Utils.empty_json
  end

  test "fetch with no network", %{bypass: bypass} do
    Bypass.down(bypass)

    assert Wroclaw.fetch(endpoint_url(bypass.port) <> @request_path) == Utils.empty_json

    Bypass.up(bypass)
  end

  test "parse_result with valid response" do
    result = valid_json_response()

    assert Wroclaw.parse_result(result) == %{nitrogen: "16", ozone: "40", particles: "13", sulphite: "2"}
  end

  test "parse_result with empty response" do
    result = Utils.empty_json

    assert Wroclaw.parse_result(result) == Measurements.unknown
  end

  test "calculate_average_from" do
    json_map =
      valid_json_response()
      |> Poison.decode!

    root = json_map["data"]["series"]
    data = Wroclaw.node_for(root,"no2")["data"]

    assert Wroclaw.calculate_average_from(data) == "16"
  end

  defp endpoint_url(port), do: "http://localhost:#{port}"

  defp valid_json_response do
    File.read!("test/wroclaw.json")
  end
end
