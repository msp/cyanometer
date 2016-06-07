defmodule Cyanometer.PageControllerTest do
  use Cyanometer.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Hello Cyanometer!"
  end
end
