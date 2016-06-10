defmodule Cyanometer.EnvironmentalDataControllerTest do
  use Cyanometer.ConnCase
  require Logger
  alias Cyanometer.Router
  alias Cyanometer.Repo
  alias Cyanometer.EnvironmentalData

  test "GET /api/environmental_datas" do
    max_records = 24

    Enum.each(1..max_records+1, fn(i) ->
      insert_environmental_data(taken_at: Ecto.DateTime.from_erl({{2016, 6, 7}, {10,0,i}}))
    end)

    all_ed_as_json =
      Repo.all(from ed in EnvironmentalData,
                       limit: ^max_records,
                       order_by: [desc: ed.taken_at])
      |> Poison.encode!

    conn = conn(:get, "/api/environmental_datas")
    response = Router.call(conn, %{})

    Logger.debug("Response: #{response.resp_body}")
    assert response.status == 200
    assert response.resp_body == all_ed_as_json
  end

  test "Successful POST to /api/environmental_datas", %{conn: conn} do
    json_sent = %{"air_pollution_index": "20",
                  "icon": "sun",
                  "taken_at": "2016-06-05T16:04:17"}

    conn = post(conn, environmental_data_path(conn, :create, json_sent))
    assert %{"message" => "inserted 2016-06-05 16:04:17 sucessfully", "status" => "ok"} = json_response(conn, 200)
  end

  test "Required JSON for POST to /api/images", %{conn: conn} do
    json_sent = %{s3_url: "", taken_at: "", blueness_index: ""}

    conn = post(conn, environmental_data_path(conn, :create, json_sent))
    assert  %{"detail" => [
                            %{"detail" => "can't be blank",
                              "source" => %{"pointer" => "/data/attributes/air_pollution_index"},
                              "title" => "Invalid Attribute"},
                            %{"detail" => "can't be blank",
                              "source" => %{"pointer" => "/data/attributes/icon"},
                              "title" => "Invalid Attribute"},
                            %{"detail" => "is invalid",
                              "source" => %{"pointer" => "/data/attributes/taken_at"},
                              "title" => "Invalid Attribute"}                          ],
              "status" => "error"} = json_response(conn, 200)
  end
end
