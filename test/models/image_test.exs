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

  # test "changeset: validate_s3_bucket, invalid bucket" do
  #   c = Map.merge(@valid_attrs, %{s3_url: "https://s3.eu-central-1.amazonaws.com/somewhere-else/nsfw.jpg"})
  #   changeset = Image.changeset(%Image{}, c)
  #   refute changeset.valid?
  # end

  test "migrate_url_changeset with valid attributes migrates url" do
    changeset = Image.migrate_url_changeset(%Image{}, @valid_attrs)
    assert changeset.valid?
    assert changeset.changes.s3_url == "https://s3.eu-central-1.amazonaws.com/cyanometerV2/test/Slovenia/Ljubljana/Central-Square/2016/06/11/sky-11.06.2016-20_38_50-large.jpg"
  end

  test "#migrate_url - creates a fully qualified URL" do
    source_bucket = "cyanometer"
    target_bucket = "cyanometerV2"
    country = "Slovenia"
    city = "Ljubljaba"
    place = "Town Square"

    initial_changeset =
      Map.merge(@valid_attrs, %{s3_url: "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-01.04.2017-13_30_45-large.jpg"})

    resulting_changeset =
      Image.changeset(%Image{}, initial_changeset)
      |> Image.migrate_url(:s3_url, source_bucket, target_bucket, country, city, place)


    expected_url = "https://s3.eu-central-1.amazonaws.com/"
                  <> "#{target_bucket}/"
                  <> "#{Mix.env}/"
                  <> "#{country}/"
                  <> "#{city}/"
                  <> "Town-Square/"
                  <> "2017/04/01/sky-01.04.2017-13_30_45-large.jpg"

    assert resulting_changeset.changes.s3_url == expected_url
    assert resulting_changeset.valid?
  end
end
