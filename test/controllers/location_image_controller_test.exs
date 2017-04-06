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
    test "GET /api/locations/:id/images - 24 records, latest first", %{conn: conn} do
      max_records = 24
      location = insert_location()
      url = location_image_path(conn, :index, location)

      Enum.each(1..max_records+1, fn(i) ->
        insert_image(%{location_id: location.id, taken_at: Ecto.DateTime.from_erl({{2016, 6, 7}, {10,0,i}})})
      end)

      images =
        Repo.all(from image in Image,
                         limit: ^max_records,
                         order_by: [desc: image.taken_at])

      conn =
        conn
        |> get(url)
        |> doc

      assert Poison.encode!(json_response(conn, 200)) == Poison.encode!(images)
    end

    test "GET /api/locations/:id/image/:id - shows chosen resource", %{conn: conn} do
      image = insert_image(@valid_attrs)
      location = insert_location()
      url = location_image_path(conn, :show, location, image)

      conn = get(conn, url)
      assert Poison.encode!(json_response(conn, 200)) == Poison.encode! image
    end

    test "GET /api/locations/:id/image/:id - does not show resource and instead throw error when location id is nonexistent", %{conn: conn} do
      url = location_image_path(conn, :show, -1, -1)

      assert_error_sent 404, fn ->
        get(conn, url)
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
      conn = put(conn, url, image: updated_image)

      assert json_response(conn, 200)["id"]
      assert Repo.get(Image, Poison.decode!(conn.resp_body)["id"]).blueness_index == "99"
    end


    test "PUT /api/locations/:id/images/:id - does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
      location = insert_location()
      image = insert_image(@valid_attrs)
      url = location_image_path(conn, :update, location, image)

      conn = put(conn, url, image: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end


    test "DELETE /api/locations/:id/images/:id - deletes chosen resource", %{conn: conn} do
      location = insert_location()
      image = insert_image(@valid_attrs)
      url = location_image_path(conn, :delete, location, image)

      conn = delete(conn, url)
      assert response(conn, 204)
      refute Repo.get(Image, image.id)
    end
  end
  # defp log_response_from(conn) do
  #   IO.puts "----------------------------------------------------------------- >"
  #   IO.puts conn.resp_body
  #   IO.puts "___________________________________________________________________"
  # end
end
