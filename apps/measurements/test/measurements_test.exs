defmodule MeasurementsTest do
  use ExUnit.Case
  doctest Measurements

  test "parse_ljubljana" do
    result =
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
    assert Measurements.parse_ljubljana(result) == %{nitrogen: "32", ozone: "39", particles: "16", sulphite: "5"}
  end

  test "parse_wroclaw" do
    result = File.read!("test/wroclaw.json")

    assert Measurements.parse_wroclaw(result) == %{nitrogen: "16", ozone: "40", particles: "13", sulphite: "2"}
  end

  test "calculate_average_from" do
    json_map =
      File.read!("test/wroclaw.json")
      |> Poison.decode!

    root = json_map["data"]["series"]
    data = Measurements.node_for(root,"no2")["data"]

    assert Measurements.calculate_average_from(data) == "16"
  end
end
