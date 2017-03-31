defmodule Cyanometer.ImageTest do
  use Cyanometer.ModelCase

  alias Cyanometer.Image

  @valid_attrs %{s3_url: "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-11.06.2016-20_38_50-large.jpg",
                 blueness_index: "1",
                 taken_at: :calendar.universal_time(),
                 location_id: 303}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Image.changeset(%Image{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with missing attributes" do
    changeset = Image.changeset(%Image{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset: validate_s3_host, valid host" do
    changeset = Image.changeset(%Image{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset: validate_s3_host, invalid host" do
    c = Map.merge(@valid_attrs, %{s3_url: "https://xxx.com/cyanometer/nsfw.jpg"})
    changeset = Image.changeset(%Image{}, c)
    refute changeset.valid?
  end

  test "changeset: validate_s3_bucket, valid bucket" do
    changeset = Image.changeset(%Image{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset: validate_s3_bucket, invalid bucket" do
    c = Map.merge(@valid_attrs, %{s3_url: "https://s3.eu-central-1.amazonaws.com/somewhere-else/nsfw.jpg"})
    changeset = Image.changeset(%Image{}, c)
    refute changeset.valid?
  end
end
