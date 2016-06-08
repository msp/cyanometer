defmodule Cyanometer.ImageControllerTest do
  use Cyanometer.ConnCase
  require Logger
  alias Cyanometer.Router
  alias Cyanometer.Repo
  alias Cyanometer.Image

  test "GET /api/images" do
    max_records = 24

    Enum.each(1..max_records+1, fn(i) ->
      insert_image(taken_at: Ecto.DateTime.from_erl({{2016, 6, 7}, {10,0,i}}))
    end)

    all_images_as_json = Repo.all(from image in Image, limit: ^max_records)
      |> Poison.encode!

    conn = conn(:get, "/api/images")
    response = Router.call(conn, %{})

    Logger.debug("Response: #{response.resp_body}")
    assert response.status == 200
    assert response.resp_body == all_images_as_json
  end

  test "Successful POST to /api/images", %{conn: conn} do
    json_sent = %{s3_url: "https://s3.cyanometer/1.jpg",
                  taken_at: "2016-06-05T16:04:17",
                  blueness_index: "4",
                  air_pollution_index: "9",
                  icon: "car"}

    conn = post(conn, image_path(conn, :create, json_sent))
    assert %{"message" => "inserted https://s3.cyanometer/1.jpg sucessfully", "status" => "ok"} = json_response(conn, 200)
  end

  test "Required JSON for POST to /api/images", %{conn: conn} do
    json_sent = %{s3_url: "", taken_at: "", blueness_index: ""}

    conn = post(conn, image_path(conn, :create, json_sent))
    assert  %{"detail" => [
                            %{"detail" => "should be at least 1 character(s)",
                             "source" => %{"pointer" => "/data/attributes/blueness_index"},
                             "title" => "Invalid Attribute"},
                            %{"detail" => "should be at least 9 character(s)",
                              "source" => %{"pointer" => "/data/attributes/s3_url"},
                              "title" => "Invalid Attribute"},
                            %{"detail" => "is invalid",
                              "source" => %{"pointer" => "/data/attributes/taken_at"},
                              "title" => "Invalid Attribute"},
                            %{"detail" => "can't be blank",
                              "source" => %{"pointer" => "/data/attributes/air_pollution_index"},
                              "title" => "Invalid Attribute"},
                            %{"detail" => "can't be blank",
                              "source" => %{"pointer" => "/data/attributes/icon"},
                              "title" => "Invalid Attribute"}
                          ],
              "status" => "error"} = json_response(conn, 200)
  end
end
