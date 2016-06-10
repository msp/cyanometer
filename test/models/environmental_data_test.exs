defmodule Cyanometer.EnvironmentalDataTest do
  use Cyanometer.ModelCase

  alias Cyanometer.EnvironmentalData

  @valid_attrs %{air_pollution_index: "some content", icon: "car", taken_at: :calendar.universal_time()}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = EnvironmentalData.changeset(%EnvironmentalData{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = EnvironmentalData.changeset(%EnvironmentalData{}, @invalid_attrs)
    refute changeset.valid?
  end
end
