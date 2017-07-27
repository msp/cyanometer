defmodule WroclawTest do
  use ExUnit.Case
  doctest Wroclaw

  test "parse_result with valid response" do
    result = File.read!("test/wroclaw.json")

    assert Wroclaw.parse_result(result) == %{nitrogen: "16", ozone: "40", particles: "13", sulphite: "2"}
  end

  test "parse_result with empty response" do
    result = Utils.empty_json

    assert Wroclaw.parse_result(result) == Measurements.unknown
  end

  test "calculate_average_from" do
    json_map =
      File.read!("test/wroclaw.json")
      |> Poison.decode!

    root = json_map["data"]["series"]
    data = Wroclaw.node_for(root,"no2")["data"]

    assert Wroclaw.calculate_average_from(data) == "16"
  end
end
