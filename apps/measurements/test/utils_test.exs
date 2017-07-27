defmodule UtilsTest do
  use ExUnit.Case
  doctest Utils

  test "extract_content_type_from" do
    response =
      %HTTPoison.Response{
        body: "",
        headers: [{"Connection", "keep-alive"}, {"Server", "Cowboy"},
        {"Date", "Sat, 06 Jun 2015 03:52:13 GMT"}, {"Content-Length", "495"},
        {"Content-Type", "application/json"}, {"Via", "1.1 vegur"}],
        status_code: 200
      }

    assert Utils.extract_content_type_from(response) == "application/json"
  end
end
