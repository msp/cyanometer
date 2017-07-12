defmodule Cyanometer.LocationImageControllerTest do
  use Cyanometer.ConnCase
  require Logger

  alias Cyanometer.Repo
  alias Cyanometer.Image

  @valid_attrs %{s3_url: "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-11.06.2016-20_38_50-large.jpg",
                taken_at: "2016-06-05T16:04:17",
                blueness_index: "4"}

  @invalid_attrs %{s3_url: "https://not-our-s3-bucket/foo.jpg"}

  describe "public endpoints:" do
    test "GET /api/locations/:id/images - defaults to 24 records, latest first", %{conn: conn} do
      max_seeded_records = 25
      expected_records = 24
      location = insert_location()
      url = location_image_path(conn, :index, location)

      Enum.each(1..max_seeded_records+1, fn(i) ->
        insert_image(%{location_id: location.id, taken_at: Ecto.DateTime.from_erl({{2016, 6, 7}, {10,0,i}})})
      end)

      images =
        Repo.all(from image in Image,
                         limit: ^max_seeded_records,
                         order_by: [desc: image.taken_at])

      conn =
        conn
        |> get(url)
        |> doc

      assert Poison.encode!(json_response(conn, 200)) == Poison.encode!(images |> Enum.take(expected_records) )
    end

    test "GET /api/locations/:id/images - returns number of requested records, latest first", %{conn: conn} do
      max_seeded_records = 6
      expected_records = max_seeded_records - 2
      location = insert_location()
      url = location_image_path(conn, :index, location, count: expected_records)

      Enum.each(1..max_seeded_records+1, fn(i) ->
        insert_image(%{location_id: location.id, taken_at: Ecto.DateTime.from_erl({{2016, 6, 7}, {10,0,i}})})
      end)

      images =
        Repo.all(from image in Image,
                         limit: ^max_seeded_records,
                         order_by: [desc: image.taken_at])

      conn =
        conn
        |> get(url)
        |> doc

      assert Poison.encode!(json_response(conn, 200)) == Poison.encode!(images |> Enum.take(expected_records) )
    end

    test "GET /api/locations/:id/images - returns requested records in date range, latest first", %{conn: conn} do
      location = insert_location()
      url = location_image_path(conn, :index, location,
                                syear: "2017", smonth: "03", sday: "01",
                                year:  "2017", month:  "04", day:  "30")

      _may_image      = insert_image(%{location_id: location.id, taken_at: Ecto.DateTime.from_erl({{2017, 5, 1}, {10,0,0}})})
      april_image     = insert_image(%{location_id: location.id, taken_at: Ecto.DateTime.from_erl({{2017, 4, 7}, {10,0,0}})})
      march_image     = insert_image(%{location_id: location.id, taken_at: Ecto.DateTime.from_erl({{2017, 3, 1}, {09,0,0}})})
      _february_image = insert_image(%{location_id: location.id, taken_at: Ecto.DateTime.from_erl({{2017, 2, 1}, {08,0,0}})})

      conn =
        conn
        |> get(url)
        |> doc

      expected_images = [april_image,march_image]

      assert Poison.encode!(json_response(conn, 200)) == Poison.encode!(expected_images)
    end

    test "GET /api/locations/:id/images - returns requested records, defaulting FROM date to before project started (1/1/16)", %{conn: conn} do
      location = insert_location()
      url = location_image_path(conn, :index, location,
                                year:  "2017", month:  "02", day:  "28")

      _may_image     = insert_image(%{location_id: location.id, taken_at: Ecto.DateTime.from_erl({{2017, 5, 1}, {10,0,0}})})
      _april_image   = insert_image(%{location_id: location.id, taken_at: Ecto.DateTime.from_erl({{2017, 4, 7}, {10,0,0}})})
      _march_image   = insert_image(%{location_id: location.id, taken_at: Ecto.DateTime.from_erl({{2017, 3, 1}, {09,0,0}})})
      february_image = insert_image(%{location_id: location.id, taken_at: Ecto.DateTime.from_erl({{2017, 2, 1}, {08,0,0}})})

      conn =
        conn
        |> get(url)
        |> doc

      expected_images = [february_image]

      assert Poison.encode!(json_response(conn, 200)) == Poison.encode!(expected_images)
    end

    test "GET /api/locations/:id/images - returns requested records, defaulting TO date to NOW", %{conn: conn} do
      location = insert_location()
      url = location_image_path(conn, :index, location,
                                syear:  "2016", smonth:  "02", sday:  "01")

      may_image      = insert_image(%{location_id: location.id, taken_at: Ecto.DateTime.from_erl({{2016, 5, 1}, {10,0,0}})})
      april_image    = insert_image(%{location_id: location.id, taken_at: Ecto.DateTime.from_erl({{2016, 4, 7}, {10,0,0}})})
      march_image    = insert_image(%{location_id: location.id, taken_at: Ecto.DateTime.from_erl({{2016, 3, 1}, {09,0,0}})})
      february_image = insert_image(%{location_id: location.id, taken_at: Ecto.DateTime.from_erl({{2016, 2, 1}, {08,0,0}})})

      conn =
        conn
        |> get(url)
        |> doc

      expected_images = [may_image, april_image, march_image, february_image]

      assert Poison.encode!(json_response(conn, 200)) == Poison.encode!(expected_images)
    end

    test "GET /api/locations/:id/image/:id - shows chosen resource", %{conn: conn} do
      image = insert_image(@valid_attrs)
      location = insert_location()
      url = location_image_path(conn, :show, location, image)

      conn =
        conn
        |> get(url)
        |> doc

      assert Poison.encode!(json_response(conn, 200)) == Poison.encode! image
    end

    test "GET /api/locations/:id/image/:id - does not show resource and instead throw error when location id is nonexistent", %{conn: conn} do
      url = location_image_path(conn, :show, -1, -1)

      assert_error_sent 404, fn ->
        conn
        |> get(url)
        |> doc
      end
    end
  end

  describe "authenticated endpoints with a valid JWT:" do
    setup [:set_json_header, :set_authorised_header]

    test "POST /api/locations/:id/images - creates and renders resource when data is valid", %{conn: conn} do
      location = insert_location()
      url = location_image_path(conn, :create, location)

      conn =
        conn
        |> post(url, image: Map.merge(@valid_attrs, %{location_id: location.id}))
        |> doc

      assert json_response(conn, 201)["id"]
      assert Repo.get(Image, Poison.decode!(conn.resp_body)["id"])
    end

    test "POST /api/locations/:id/image - does not create resource and renders errors when data is invalid", %{conn: conn} do
      location = insert_location()
      url = location_image_path(conn, :create, location)
      conn =
        conn
        |> post(url, image: @invalid_attrs)
        |> doc

      assert json_response(conn, 422)["errors"] != %{}
    end

    test "PUT /api/locations/:id/images/:id - updates and renders chosen resource when data is valid", %{conn: conn} do
      location = insert_location()
      image = insert_image(@valid_attrs)
      updated_image = Map.merge(@valid_attrs, %{blueness_index: "99"})
      url = location_image_path(conn, :update, location, image)

      conn =
        conn
        |> put(url, image: updated_image)
        |> doc

      assert json_response(conn, 200)["id"]
      assert Repo.get(Image, Poison.decode!(conn.resp_body)["id"]).blueness_index == "99"
    end


    test "PUT /api/locations/:id/images/:id - does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
      location = insert_location()
      image = insert_image(@valid_attrs)
      url = location_image_path(conn, :update, location, image)

      conn =
        conn
        |> put(url, image: @invalid_attrs)
        |> doc

      assert json_response(conn, 422)["errors"] != %{}
    end


    test "DELETE /api/locations/:id/images/:id - deletes chosen resource", %{conn: conn} do
      location = insert_location()
      image = insert_image(@valid_attrs)
      url = location_image_path(conn, :delete, location, image)

      conn =
        conn
        |> delete(url)
        |> doc

      assert response(conn, 204)
      refute Repo.get(Image, image.id)
    end
  end
end
