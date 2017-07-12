defmodule Cyanometer.LocationEnvironmentalDataControllerTest do
  use Cyanometer.ConnCase
  require Logger

  alias Cyanometer.Repo
  alias Cyanometer.EnvironmentalData

  @valid_attrs %{"air_pollution_index": "20",
                "icon": "sun",
                "taken_at": "2016-06-05T16:04:17"}

  @invalid_attrs %{"icon": "invalid-icon"}

  describe "public endpoints:" do
    test "GET /api/locations/:id/environmental_data - defaults to 24 records, latest first", %{conn: conn} do
      max_seeded_records = 25
      expected_records = 24
      london = insert_location(%{country: "UK", city: "London", place: "Brick Lane"})
      slovenia = insert_location(%{country: "Slovenia"})

      url = location_environmental_data_path(conn, :index, london)

      Enum.each(1..max_seeded_records+1, fn(i) ->
        insert_environmental_data(%{location_id: london.id, taken_at: Ecto.DateTime.from_erl({{2016, 6, 7}, {10,0,i}})})
      end)

      Enum.each(1..max_seeded_records+1, fn(i) ->
        insert_environmental_data(%{location_id: slovenia.id, taken_at: Ecto.DateTime.from_erl({{2016, 8, 8}, {09,0,i}})})
      end)

      eds =
        Repo.all(from ed in EnvironmentalData,
                         limit: ^max_seeded_records,
                         order_by: [desc: ed.taken_at],
                         where: ed.location_id == ^london.id)

      conn =
        conn
        |> get(url)
        |> doc

      assert Poison.encode!(json_response(conn, 200)) == Poison.encode!(eds |> Enum.take(expected_records) )
    end

    test "GET /api/locations/:id/environmental_data/:id - shows chosen resource", %{conn: conn} do
      location = insert_location()
      ed = insert_environmental_data(Map.merge(@valid_attrs, %{location_id: location.id}))
      url = location_environmental_data_path(conn, :show, location, ed)

      conn =
        conn
        |> get(url)
        |> doc

      assert Poison.encode!(json_response(conn, 200)) == Poison.encode! ed
    end

    test "GET /api/locations/:id/environmental_data/:id - does not show resource and instead throw error when location id is nonexistent", %{conn: conn} do
      url = location_environmental_data_path(conn, :show, -1, -1)

      assert_error_sent 404, fn ->
        conn
        |> get(url)
        |> doc
      end
    end
  end

  describe "authenticated endpoints with a valid JWT:" do
    setup [:set_json_header, :set_authorised_header]

    test "POST /api/locations/:id/environmental_data - creates and renders resource when data is valid", %{conn: conn} do
      location = insert_location()
      url = location_environmental_data_path(conn, :create, location)

      conn =
        conn
        |> post(url, environmental_data: Map.merge(@valid_attrs, %{location_id: location.id}))
        |> doc

      assert json_response(conn, 201)["id"]
      assert Repo.get(EnvironmentalData, Poison.decode!(conn.resp_body)["id"])
    end

    test "POST /api/locations/:id/environmental_data - does not create resource and renders errors when data is invalid", %{conn: conn} do
      location = insert_location()
      url = location_environmental_data_path(conn, :create, location)
      conn =
        conn
        |> post(url, environmental_data: @invalid_attrs)
        |> doc

      assert json_response(conn, 422)["errors"] != %{}
    end

    test "PUT /api/locations/:id/environmental_data/:id - updates and renders chosen resource when data is valid", %{conn: conn} do
      location = insert_location()
      ed = insert_environmental_data(Map.merge(@valid_attrs, %{location_id: location.id}))
      updated_ed = Map.merge(@valid_attrs, %{air_pollution_index: "99"})
      url = location_environmental_data_path(conn, :update, location, ed)

      conn =
        conn
        |> put(url, environmental_data: updated_ed)
        |> doc

      assert json_response(conn, 200)["id"]
      assert Repo.get(EnvironmentalData, Poison.decode!(conn.resp_body)["id"]).air_pollution_index == "99"
    end


    test "PUT /api/locations/:id/environmental_data/:id - does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
      location = insert_location()
      ed = insert_environmental_data(Map.merge(@valid_attrs, %{location_id: location.id}))
      url = location_environmental_data_path(conn, :update, location, ed)

      conn =
        conn
        |> put(url, environmental_data: @invalid_attrs)
        |> doc

      assert json_response(conn, 422)["errors"] != %{}
    end

    test "DELETE /api/locations/:id/environmental_data/:id - deletes chosen resource", %{conn: conn} do
      location = insert_location()
      ed = insert_environmental_data(Map.merge(@valid_attrs, %{location_id: location.id}))
      url = location_environmental_data_path(conn, :delete, location, ed)

      conn =
        conn
        |> delete(url)
        |> doc

      assert response(conn, 204)
      refute Repo.get(EnvironmentalData, ed.id)
    end
  end
end
