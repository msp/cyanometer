defmodule Cyanometer.ImageControllerTest do
  use Cyanometer.ConnCase

  test "Successful POST to /api/images", %{conn: conn} do
    json_sent = %{s3_url: "https://s3.cyanometer/1.jpg",
                  taken_at: "2016-06-05T16:04:17",
                  blueness_index: "4"}

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
                              "title" => "Invalid Attribute"}
                          ],
              "status" => "error"} = json_response(conn, 200)
  end
end
