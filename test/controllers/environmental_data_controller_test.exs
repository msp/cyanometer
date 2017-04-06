defmodule Cyanometer.EnvironmentalDataControllerTest do
  use Cyanometer.ConnCase
  require Logger

  alias Cyanometer.Repo
  alias Cyanometer.EnvironmentalData


  @valid_attrs %{"air_pollution_index": "20",
                "icon": "sun",
                "taken_at": "2016-06-05T16:04:17"}

  @invalid_attrs %{}

  describe "public endpoints:" do
    test "GET /api/environmental_data", %{conn: conn} do
      max_records = 24

      Enum.each(1..max_records+1, fn(i) ->
        insert_environmental_data(%{taken_at: Ecto.DateTime.from_erl({{2016, 6, 7}, {10,0,i}})})
      end)

      eds =
        Repo.all(from ed in EnvironmentalData,
                         limit: ^max_records,
                         order_by: [desc: ed.taken_at])

      conn =
        conn
        |> get(environmental_data_path(conn, :index))
        |> doc

      assert Poison.encode!(json_response(conn, 200)) == Poison.encode!(eds)
    end

    test "GET /api/environmental_data/:id - shows chosen resource", %{conn: conn} do
      ed = insert_environmental_data(@valid_attrs)

      conn =
        conn
        |> get(environmental_data_path(conn, :show, ed))
        |> doc

      assert Poison.encode!(json_response(conn, 200)) == Poison.encode! ed
    end

    test "GET /api/environmental_data/:id - does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
      assert_error_sent 404, fn ->
        conn
        |> get(environmental_data_path(conn, :show, -1))
        |> doc
      end
    end
  end

  describe "authenticated endpoints with a valid JWT:" do
    setup [:set_json_header, :set_authorised_header]

    test "POST /api/environmental_data - creates and renders resource when data is valid", %{conn: conn} do
      url = environmental_data_path(conn, :create)
      conn =
        conn
          |> post(url, environmental_data: @valid_attrs)
          |> doc

      assert json_response(conn, 201)["id"]
      assert Repo.get(EnvironmentalData, Poison.decode!(conn.resp_body)["id"])
    end

    test "POST /api/environmental_data - does not create resource and renders errors when data is invalid", %{conn: conn} do
      url = environmental_data_path(conn, :create)

      conn =
        conn
        |> post(url, environmental_data: @invalid_attrs)
        |> doc

      assert json_response(conn, 422)["errors"] != %{}
    end
  end
end
