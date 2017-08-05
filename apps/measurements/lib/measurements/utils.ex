defmodule Utils do
  def extract_content_type_from(response) do
    content_type =
      Enum.filter(response.headers,
        fn(header) ->
          key =
            Tuple.to_list(header)
            |> Enum.at(0)

          key == "Content-Type"
        end)

    content_type
      |> Enum.at(0)
      |> Tuple.to_list
      |> Enum.at(1)
  end

  def empty_json do
    "{}"
  end

  def empty_xml do
    "<xml></xml>"
  end
end
