defmodule MeasurementsTest do
  use ExUnit.Case
  doctest Measurements

  # setup do
  #   Code.require_file("test/mocks/ljubljana_mock.ex")
  #   Code.require_file("test/mocks/wroclaw_mock.ex")
  # end

  test "ljubljana" do
    assert Measurements.ljubljana == LjubljanaMock.measurements
  end

  test "wroclaw" do
    assert Measurements.wroclaw == WroclawMock.measurements
  end

  test "fetch_for(:ljubljana)" do
    assert Measurements.fetch_for(:ljubljana) == LjubljanaMock.measurements
  end

  test "fetch_for(:wroclaw)" do
    assert Measurements.fetch_for(:wroclaw) == WroclawMock.measurements
  end

  test "fetch_for(:london)" do
    assert Measurements.fetch_for(:london) == Measurements.unknown
  end

  test "init" do
    assert Measurements.init(%{}) ==
      {:ok,
        %{ljubljana: LjubljanaMock.measurements,
          wroclaw: WroclawMock.measurements}
      }
  end
end
