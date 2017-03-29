defmodule Cyanometer.LocationTest do
  use Cyanometer.ModelCase

  alias Cyanometer.Location

  @valid_attrs %{city: "some content", country: "some content", place: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Location.changeset(%Location{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Location.changeset(%Location{}, @invalid_attrs)
    refute changeset.valid?
  end
end
