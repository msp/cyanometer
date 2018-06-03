defmodule LjubljanaTest do
  use ExUnit.Case
  doctest Ljubljana

  @request_path "/xml/zrak/ones_zrak_urni_podatki_zadnji.xml"

  setup do
    bypass = Bypass.open
    {:ok, bypass: bypass}
  end

  test "fetch with a valid response", %{bypass: bypass} do
    Bypass.expect_once bypass, "GET", @request_path, fn conn ->
      conn
      |> Plug.Conn.put_resp_header("Content-Type", "application/xml")
      |> Plug.Conn.resp(200, valid_xml_response())
    end

    assert Ljubljana.fetch(endpoint_url(bypass.port) <> @request_path) == valid_xml_response()
  end

  test "fetch with a 404", %{bypass: bypass} do
    Bypass.expect_once bypass, "GET", "/some-bad-path", fn conn ->
      conn
      |> Plug.Conn.put_resp_header("Content-Type", "text/html")
      |> Plug.Conn.resp(404, ~s(<html><body><h1>Page not found</h1></body></html>))
    end

    assert Ljubljana.fetch(endpoint_url(bypass.port) <> "/some-bad-path") == Utils.empty_xml
  end

  test "fetch with a catchall HTTP resp", %{bypass: bypass} do
    Bypass.expect_once bypass, "GET", @request_path, fn conn ->
      conn
      |> Plug.Conn.put_resp_header("Content-Type", "text/html")
      |> Plug.Conn.resp(418, ~s(<html><body><h1>WTF</h1></body></html>))
    end

    assert Ljubljana.fetch(endpoint_url(bypass.port) <> @request_path) == Utils.empty_xml
  end

  test "fetch with a 500", %{bypass: bypass} do
    Bypass.expect_once bypass, "GET", "/will-asplode", fn conn ->
      conn
      |> Plug.Conn.put_resp_header("Content-Type", "text/html")
      |> Plug.Conn.resp(500, ~s(<html><body><h1>Internal server error</h1></body></html>))
    end

    assert Ljubljana.fetch(endpoint_url(bypass.port) <> "/will-asplode") == Utils.empty_xml
  end

  test "fetch with an invalid Content-Type", %{bypass: bypass} do
    Bypass.expect_once bypass, "GET", @request_path, fn conn ->
      conn
      |> Plug.Conn.put_resp_header("Content-Type", "text/html")
      |> Plug.Conn.resp(200, ~s(<html><body><h1>What even is this?</h1></body></html>))
    end

    assert Ljubljana.fetch(endpoint_url(bypass.port) <> @request_path) == Utils.empty_xml
  end

  test "fetch with no network", %{bypass: bypass} do
    Bypass.down(bypass)

    assert Ljubljana.fetch(endpoint_url(bypass.port) <> @request_path) == Utils.empty_xml

    Bypass.up(bypass)
  end

  test "parse_result with valid response" do
    result = valid_xml_response()
    assert Ljubljana.parse_result(result) == %{nitrogen: "32", ozone: "39", particles: "16", sulphite: "5"}
  end

  test "parse_result with empty response" do
    result = Utils.empty_xml

    assert Ljubljana.parse_result(result) == Measurements.unknown
  end

  defp endpoint_url(port), do: "http://localhost:#{port}"

  defp valid_xml_response() do
    """
    <postaja sifra="E21" ge_dolzina="14.512704" ge_sirina="46.065497" nadm_visina="299">
     <merilno_mesto>Ljubljana Bežigrad</merilno_mesto>
     <datum_od>2016-06-11 00:00</datum_od>
     <datum_do>2016-06-11 01:00</datum_do>
     <so2>5</so2>
     <co>0.2</co>
     <o3>39</o3>
     <no2>32</no2>
     <pm10>16</pm10>
    </postaja>
    """
  end
end
