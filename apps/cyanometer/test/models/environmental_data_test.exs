defmodule Cyanometer.EnvironmentalDataTest do
  use Cyanometer.ModelCase

  alias Cyanometer.EnvironmentalData

  import Cyanometer.TestHelpers

  @valid_attrs %{air_pollution_index: "10", icon: "car", taken_at: :calendar.universal_time(), location_id: 303}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = EnvironmentalData.changeset(%EnvironmentalData{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = EnvironmentalData.changeset(%EnvironmentalData{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "Taken_at is unique only per location" do
    some_time= Ecto.DateTime.from_erl({{2017, 4, 4}, {10,0,0}})

    london = insert_location(%{country: "UK", city: "London", place: "Brick Lane"})
    insert_environmental_data(Map.merge(@valid_attrs, %{location_id: london.id, taken_at: some_time}))

    ljubljana = insert_location(%{country: "Slovenia", city: "Ljubljana", place: "Central Square"})
    changeset = EnvironmentalData.changeset(%EnvironmentalData{}, Map.merge(@valid_attrs, %{location_id: ljubljana.id, taken_at: some_time}))

    assert changeset.valid?
    Repo.insert! changeset
  end

end
