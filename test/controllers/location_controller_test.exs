defmodule Cyanometer.LocationControllerTest do
  use Cyanometer.ConnCase

  alias Cyanometer.Location

  @valid_attrs %{city: "Ljubjana", country: "Slovenia", place: "Town Square"}
  @invalid_attrs %{}

  describe "public endpoints:" do
    test "GET /api/locations - lists all entries on index", %{conn: conn} do
      max_records = 5

      Enum.each(1..max_records, fn(i) ->
        insert_location(%{country: "Country-#{i}", city: "City-#{i}", place: "Place-#{i}"})
      end)

      locations =
        Repo.all(from location in Location,
                         limit: ^max_records,
                         order_by: [asc: location.city])

      conn =
        conn
          |> get(location_path(conn, :index))
          |> doc

      assert Poison.encode!(json_response(conn, 200)) == Poison.encode!(locations)
    end

    test "GET /api/locations/:id -shows chosen resource", %{conn: conn} do
      location = Repo.insert! %Location{}

      conn =
        conn
          |> get(location_path(conn, :show, location))
          |> doc

      assert json_response(conn, 200) == %{"id" => location.id,
        "country" => location.country,
        "city" => location.city,
        "place" => location.place}
    end

    test "GET /api/locations/:id -does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
      assert_error_sent 404, fn ->
        conn
          |> get(location_path(conn, :show, -1))
          |> doc
      end
    end
  end

  describe "authenticated endpoints with a valid JWT:" do
    setup [:set_json_header, :set_authorised_header]

    test "POST /api/locations - creates and renders resource when data is valid", %{conn: conn} do
      conn =
        conn
        |> post(location_path(conn, :create), location: @valid_attrs)
        |> doc

      assert json_response(conn, 201)["id"]
      assert Repo.get_by(Location, @valid_attrs)
    end

    test "POST /api/locations - does not create resource and renders errors when data is invalid", %{conn: conn} do
      conn =
        conn
        |> post(location_path(conn, :create), location: @invalid_attrs)
        |> doc

      assert json_response(conn, 422)["errors"] != %{}
    end

    test "PUT /api/locations/:id - updates and renders chosen resource when data is valid", %{conn: conn} do
      location = Repo.insert! %Location{}
      conn =
        conn
          |> put(location_path(conn, :update, location), location: @valid_attrs)
          |> doc

      assert json_response(conn, 200)["id"]
      assert Repo.get_by(Location, @valid_attrs)
    end

    test "PUT /api/locations/:id - does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
      location = Repo.insert! %Location{}
      conn =
        conn
          |> put(location_path(conn, :update, location), location: @invalid_attrs)
          |> doc

      assert json_response(conn, 422)["errors"] != %{}
    end

    test "DELETE /api/locations/:id - deletes chosen resource", %{conn: conn} do
      location = Repo.insert! %Location{}

      conn =
        conn
          |> delete(location_path(conn, :delete, location))
          |> doc

      assert response(conn, 204)
      refute Repo.get(Location, location.id)
    end
  end

  describe "authenticated endpoints with a INVALID JWT:" do
    setup [:set_json_header, :set_unauthorised_header]

    test "POST /api/locations - creates and renders resource when data is valid", %{conn: conn} do
      conn =
        conn
        |> post(location_path(conn, :create), location: @valid_attrs)

      assert conn.status == 401
      assert conn.resp_body == "Invalid signature"
    end
  end

  describe "authenticated endpoints with a missing auth header:" do
    setup [:set_json_header]

    test "POST /api/locations - creates and renders resource when data is valid", %{conn: conn} do
      conn =
        conn
        |> post(location_path(conn, :create), location: @valid_attrs)

      assert conn.status == 401
      assert conn.resp_body == "Unauthorized"
    end
  end
end
