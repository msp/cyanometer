defmodule WroclawTest do
  use ExUnit.Case
  doctest Wroclaw

  test "parse_result" do
    result = File.read!("test/wroclaw.json")

    assert Wroclaw.parse_result(result) == %{nitrogen: "16", ozone: "40", particles: "13", sulphite: "2"}
  end

  test "calculate_average_from" do
    json_map =
      File.read!("test/wroclaw.json")
      |> Poison.decode!

    root = json_map["data"]["series"]
    data = Wroclaw.node_for(root,"no2")["data"]

    assert Wroclaw.calculate_average_from(data) == "16"
  end

  test "extract_content_type_from" do
    response =
      %HTTPoison.Response{
        body: "",
        headers: [{"Connection", "keep-alive"}, {"Server", "Cowboy"},
        {"Date", "Sat, 06 Jun 2015 03:52:13 GMT"}, {"Content-Length", "495"},
        {"Content-Type", "application/json"}, {"Via", "1.1 vegur"}],
        status_code: 200
      }

    assert Wroclaw.extract_content_type_from(response) == "application/json"
  end
end
