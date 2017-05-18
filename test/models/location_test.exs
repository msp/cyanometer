defmodule Cyanometer.LocationTest do
  use Cyanometer.ModelCase

  alias Cyanometer.Location

  @valid_attrs %{city: "some content", country: "some content", place: "some content", air_quality_source: "some air quality source", air_quality_link: "http://somewhere.com"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Location.changeset(%Location{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Location.changeset(%Location{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset with invalid attributes: url" do
    changeset = Location.changeset(%Location{}, Map.merge(@valid_attrs, %{air_quality_link: "not-a-link"}))
    refute changeset.valid?
  end
end
