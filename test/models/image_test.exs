defmodule Cyanometer.ImageTest do
  use Cyanometer.ModelCase

  alias Cyanometer.Image

  import Cyanometer.TestHelpers

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
    assert changeset.changes.s3_url == "https://s3.eu-central-1.amazonaws.com/cyanometer-v2/test/Slovenia/Ljubljana/Central-Square/2016/06/11/sky-11.06.2016-20_38_50-large.jpg"
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

  test "Taken_at is unique only per location" do
    some_time= Ecto.DateTime.from_erl({{2017, 4, 4}, {10,0,0}})

    london = insert_location(%{country: "UK", city: "London", place: "Brick Lane"})
    insert_image(%{location_id: london.id, taken_at: some_time})

    ljubljana = insert_location(%{country: "Slovenia", city: "Ljubljana", place: "Central Square"})
    changeset = Image.changeset(%Image{}, Map.merge(@valid_attrs, %{location_id: ljubljana.id, taken_at: some_time, s3_url: "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-04.04.2017-10_00_00-large.jpg"}))

    assert changeset.valid?
    Repo.insert! changeset
  end

  test "collect_images_from: one per location" do
    total_required = 3
    index = 0
    groups = %{1 => [%{id: "a"}, %{id: "b"}, %{id: "z"}],
               2 => [%{id: "c"}, %{id: "d"}],
               3 => [%{id: "e"}, %{id: "f"}]}
    results = Image.collect_images_from(groups, index, total_required, [])

    assert results == [%{id: "a"}, %{id: "c"}, %{id: "e"}]
  end

  test "collect_images_from: two from first, one from second" do
    total_required = 3
    index = 0
    groups = %{1 => [%{id: "a"}, %{id: "b"}],
               2 => [%{id: "c"}, %{id: "d"}]}
    results = Image.collect_images_from(groups, index, total_required, [])

    assert results == [%{id: "a"}, %{id: "c"}, %{id: "b"}]
  end

  test "collect_images_from: two from first, two from second" do
    total_required = 4
    index = 0
    groups = %{1 => [%{id: "a"}, %{id: "b"}],
               2 => [%{id: "c"}, %{id: "d"}]}
    results = Image.collect_images_from(groups, index, total_required, [])

    assert results == [%{id: "a"}, %{id: "c"}, %{id: "b"}, %{id: "d"}]
  end

  test "collect_images_from: all from first" do
    total_required = 3
    index = 0
    groups = %{1 => [%{id: "a"}, %{id: "b"}, %{id: "c"}]}

    results = Image.collect_images_from(groups, index, total_required, [])

    assert results == [%{id: "a"}, %{id: "b"}, %{id: "c"}]
  end

  test "collect_images_from: ask for more than available" do
    total_required = 3000000
    index = 0
    groups = %{1 => [%{id: "a"}, %{id: "b"}, %{id: "c"}]}

    results = Image.collect_images_from(groups, index, total_required, [])

    assert results == [%{id: "a"}, %{id: "b"}, %{id: "c"}]
  end

  test "collect_images_from: ask for less than available" do
    total_required = 1
    index = 0
    groups = %{1 => [%{id: "a"}, %{id: "b"}, %{id: "c"}]}

    results = Image.collect_images_from(groups, index, total_required, [])

    assert results == [%{id: "a"}]
  end
end
