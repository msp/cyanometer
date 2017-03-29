defmodule Cyanometer.ImageControllerTest do
  use Cyanometer.ConnCase
  require Logger

  alias Cyanometer.Router
  alias Cyanometer.Repo
  alias Cyanometer.Image

  @valid_attrs %{s3_url: "https://s3.eu-central-1.amazonaws.com/cyanometer/sky-11.06.2016-20_38_50-large.jpg",
                taken_at: "2016-06-05T16:04:17",
                blueness_index: "4"}

  @invalid_attrs %{s3_url: "https://not-our-s3-bucket/foo.jpg"}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "GET /api/images - 24 records, latest first", %{conn: conn} do
    max_records = 24

    Enum.each(1..max_records+1, fn(i) ->
      insert_image(taken_at: Ecto.DateTime.from_erl({{2016, 6, 7}, {10,0,i}}))
    end)

    images =
      Repo.all(from image in Image,
                       limit: ^max_records,
                       order_by: [desc: image.taken_at])

    conn = get conn, image_path(conn, :index)
    assert Poison.encode!(json_response(conn, 200)) == Poison.encode!(images)
  end

  test "GET /api/image/:id - shows chosen resource", %{conn: conn} do
    image = insert_image(@valid_attrs)

    conn = get conn, image_path(conn, :show, image)
    assert Poison.encode!(json_response(conn, 200)) == Poison.encode! image
  end

  test "GET /api/image/:id - does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, image_path(conn, :show, -1)
    end
  end

  test "POST /api/images - creates and renders resource when data is valid", %{conn: conn} do
    conn = post(conn, image_path(conn, :create), image: @valid_attrs)

    assert json_response(conn, 201)["id"]
    assert Repo.get_by(Image, @valid_attrs)
  end

  test "POST /api/images/ - does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post(conn, image_path(conn, :create), image: @invalid_attrs)
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "PUT /api/images/:id - updates and renders chosen resource when data is valid", %{conn: conn} do
    image = insert_image(@valid_attrs)
    conn = put(conn, image_path(conn, :update, image), image: @valid_attrs)
    assert json_response(conn, 200)["id"]
    assert Repo.get_by(Image, @valid_attrs)
  end


  test "PUT /api/images/:id - does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    image = insert_image(@valid_attrs)
    conn = put(conn, image_path(conn, :update, %Image{id: image.id}), image: @invalid_attrs)
    assert json_response(conn, 422)["errors"] != %{}
  end


  test "DELETE /api/images/:id - deletes chosen resource", %{conn: conn} do
    image = insert_image(@valid_attrs)
    path = image_path(conn, :delete, image)
    IO.puts "-----------------"
    IO.inspect path
    conn = delete(conn, path)
    assert response(conn, 204)
    refute Repo.get(Image, image.id)
  end



  #
  # test "Required JSON for POST to /api/images", %{conn: conn} do
  #   json_sent = %{s3_url: "", taken_at: "", blueness_index: ""}
  #
  #   conn = post(conn, image_path(conn, :create, json_sent))
  #   assert  %{"detail" => [
  #                           %{"detail" => "invalid url: :no_scheme",
  #                             "source" => %{"pointer" => "/data/attributes/s3_url"},
  #                             "title" => "Invalid Attribute"},
  #                           %{"detail" => "should be at least 1 character(s)",
  #                            "source" => %{"pointer" => "/data/attributes/blueness_index"},
  #                            "title" => "Invalid Attribute"},
  #                           %{"detail" => "should be at least 9 character(s)",
  #                             "source" => %{"pointer" => "/data/attributes/s3_url"},
  #                             "title" => "Invalid Attribute"},
  #                           %{"detail" => "is invalid",
  #                             "source" => %{"pointer" => "/data/attributes/taken_at"},
  #                             "title" => "Invalid Attribute"},
  #                         ],
  #             "status" => "error"} = json_response(conn, 422)
  # end

  defp log_response_from(conn) do
    IO.puts "----------------------------------------------------------------- >"
    IO.puts conn.resp_body
  end
end
