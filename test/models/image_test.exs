defmodule Cyanometer.ImageTest do
  use Cyanometer.ModelCase

  alias Cyanometer.Image

  @valid_attrs %{s3_url: "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-11.06.2016-20_38_50-large.jpg",
                 blueness_index: "1",
                 taken_at: :calendar.universal_time()}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Image.changeset(%Image{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Image.changeset(%Image{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset with image not from our S3 bucket" do
    invalid_attrs_url = %{s3_url: "https://s3.eu-central-1.amazonaws.com/somewhere-else/nsfw.jpg",
                       blueness_index: "1",
                       taken_at: :calendar.universal_time()}

    changeset = Image.changeset(%Image{}, invalid_attrs_url)
    refute changeset.valid?

    invalid_attrs_url = %{s3_url: "https://xxx.com/cyanometer/nsfw.jpg",
                       blueness_index: "1",
                       taken_at: :calendar.universal_time()}

    changeset = Image.changeset(%Image{}, invalid_attrs_url)
    refute changeset.valid?

    invalid_attrs_url = %{s3_url: "https://s3.eu-central-1.amazonaws.com/somewhere-else/cyanometer.jpg",
                       blueness_index: "1",
                       taken_at: :calendar.universal_time()}

    changeset = Image.changeset(%Image{}, invalid_attrs_url)
    refute changeset.valid?
  end
end
