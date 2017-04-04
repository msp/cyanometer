defmodule Cyanometer.LocationControllerTest do
  use Cyanometer.ConnCase

  alias Cyanometer.Location
  @valid_attrs %{city: "Ljubjana", country: "Slovenia", place: "Town Square"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

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
    conn = get conn, location_path(conn, :show, location)
    assert json_response(conn, 200) == %{"id" => location.id,
      "country" => location.country,
      "city" => location.city,
      "place" => location.place}
  end

  test "GET /api/locations/:id -does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, location_path(conn, :show, -1)
    end
  end

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
    conn = put conn, location_path(conn, :update, location), location: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "DELETE /api/locations/:id - deletes chosen resource", %{conn: conn} do
    location = Repo.insert! %Location{}
    conn = delete conn, location_path(conn, :delete, location)
    assert response(conn, 204)
    refute Repo.get(Location, location.id)
  end
end
