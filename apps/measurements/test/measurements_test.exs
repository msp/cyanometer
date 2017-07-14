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
    assert Measurements.parse_ljubljana(result) == %{nitrogen: '32', ozone: '39', particles: '16', sulphite: '5'}
  end
end
