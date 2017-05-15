defmodule Cyanometer.ImageControllerTest do
  use Cyanometer.ConnCase
  require Logger

  alias Cyanometer.Repo
  alias Cyanometer.Image

  @valid_attrs %{s3_url: "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-11.06.2016-20_38_50-large.jpg",
                taken_at: "2016-06-05T16:04:17",
                blueness_index: "4"}

  @invalid_attrs %{s3_url: "https://not-our-s3-bucket/foo.jpg"}

  describe "public endpoints:" do
    test "GET /api/image/:id - shows chosen resource", %{conn: conn} do
      image = insert_image(@valid_attrs)

      conn = get conn, image_path(conn, :show, image)
      assert Poison.encode!(json_response(conn, 200)) == Poison.encode! image
    end

    test "GET /landing - returns latest image per location from multi locations", %{conn: conn} do
      count = 3

      london = insert_location(%{country: "UK", city: "London", place: "Brick Lane"})
      london_image = insert_image(%{location_id: london.id, taken_at: Ecto.DateTime.from_erl({{2017, 4, 4}, {10,30,0}})})

      ljubljana = insert_location(%{country: "Slovenia", city: "Ljubljana", place: "Central Square"})
      ljubljana_image = insert_image(%{location_id: ljubljana.id, taken_at: Ecto.DateTime.from_erl({{2017, 4, 4}, {10,15,0}})})

      moscow = insert_location(%{country: "Russia", city: "Moscow", place: "Gallery"})
      moscow_image = insert_image(%{location_id: moscow.id, taken_at: Ecto.DateTime.from_erl({{2017, 4, 4}, {10,00,0}})})

      conn =
        conn
          |> get(image_path(conn, :landing, count))
          |> doc

      expected_images = [london_image, ljubljana_image, moscow_image]
      assert_response_contains(conn, expected_images)
    end

    test "GET /landing - returns latest image per location from multi locations, staggered dates", %{conn: conn} do
      count = 3

      london = insert_location(%{country: "UK", city: "London", place: "Brick Lane"})
      london_image = insert_image(%{location_id: london.id, taken_at: Ecto.DateTime.from_erl({{2017, 4, 4}, {10,30,0}})})
      _london_image2 = insert_image(%{location_id: london.id, taken_at: Ecto.DateTime.from_erl({{2017, 4, 4}, {09,30,0}})})
      _london_image3 = insert_image(%{location_id: london.id, taken_at: Ecto.DateTime.from_erl({{2017, 4, 4}, {08,30,0}})})

      ljubljana = insert_location(%{country: "Slovenia", city: "Ljubljana", place: "Central Square"})
      ljubljana_image = insert_image(%{location_id: ljubljana.id, taken_at: Ecto.DateTime.from_erl({{2017, 1, 4}, {10,15,0}})})
      _ljubljana_image2 = insert_image(%{location_id: ljubljana.id, taken_at: Ecto.DateTime.from_erl({{2017, 1, 4}, {10,00,0}})})

      moscow = insert_location(%{country: "Russia", city: "Moscow", place: "Gallery"})
      moscow_image = insert_image(%{location_id: moscow.id, taken_at: Ecto.DateTime.from_erl({{2017, 1, 4}, {10,00,0}})})
      _moscow_image2 = insert_image(%{location_id: moscow.id, taken_at: Ecto.DateTime.from_erl({{2017, 1, 4}, {09,45,0}})})

      conn =
        conn
          |> get(image_path(conn, :landing, count))
          |> doc

      expected_images = [london_image, ljubljana_image, moscow_image]
      assert_response_contains(conn, expected_images)
    end

    test "GET /landing - returns latest images from single location", %{conn: conn} do
      count = 3

      london = insert_location(%{country: "UK", city: "London", place: "Brick Lane"})
      _london_image  = insert_image(%{location_id: london.id, taken_at: Ecto.DateTime.from_erl({{2017, 4, 4}, {10, 0,0}})})
      _london_image2 = insert_image(%{location_id: london.id, taken_at: Ecto.DateTime.from_erl({{2017, 4, 4}, {10,15,0}})})
      london_image3 = insert_image(%{location_id: london.id, taken_at: Ecto.DateTime.from_erl({{2017, 4, 4}, {10,30,0}})})
      london_image4 = insert_image(%{location_id: london.id, taken_at: Ecto.DateTime.from_erl({{2017, 4, 4}, {10,45,0}})})
      london_image5 = insert_image(%{location_id: london.id, taken_at: Ecto.DateTime.from_erl({{2017, 4, 4}, {11,30,0}})})

      conn =
        conn
          |> get(image_path(conn, :landing, count))

      expected_images = [london_image5, london_image4, london_image3]
      assert_response_contains(conn, expected_images)
    end

    test "GET /api/image/:id - does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
      assert_error_sent 404, fn ->
        get conn, image_path(conn, :show, -1)
      end
    end
  end

  describe "authenticated endpoints with a valid JWT:" do
    setup [:set_json_header, :set_authorised_header]

    test "POST /api/images - creates and renders resource when data is valid", %{conn: conn} do
      location = insert_location()
      conn = post(conn, image_path(conn, :create), image: Map.merge(@valid_attrs, %{location_id: location.id}))

      assert json_response(conn, 201)["id"]
      assert Repo.get(Image, Poison.decode!(conn.resp_body)["id"])
    end

    test "POST /api/images/ - does not create resource and renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, image_path(conn, :create), image: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end

    test "PUT /api/images/:id - updates and renders chosen resource when data is valid", %{conn: conn} do
      image = insert_image(@valid_attrs)
      updated_image = Map.merge(@valid_attrs, %{blueness_index: "99"})
      conn = put(conn, image_path(conn, :update, image), image: updated_image)

      assert json_response(conn, 200)["id"]
      assert Repo.get(Image, Poison.decode!(conn.resp_body)["id"]).blueness_index == "99"
    end


    test "PUT /api/images/:id - does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
      image = insert_image(@valid_attrs)

      conn = put(conn, image_path(conn, :update, %Image{id: image.id}), image: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end


    test "DELETE /api/images/:id - deletes chosen resource", %{conn: conn} do
      image = insert_image(@valid_attrs)
      path = image_path(conn, :delete, image)

      conn = delete(conn, path)
      assert response(conn, 204)
      refute Repo.get(Image, image.id)
    end
  end

  defp assert_response_contains(conn, expected_images) do
    resp = conn.resp_body

    Enum.map(expected_images, fn(image) ->
      assert resp =~ Integer.to_string(image.id)
      assert resp =~ image.s3_url
      assert resp =~ Integer.to_string(image.location.id)
    end)
  end
end
