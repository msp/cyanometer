defmodule Wroclaw do
  require Logger

  @behaviour City

  @endpoint "http://air.wroclaw.pios.gov.pl/dane-pomiarowe/api/automatyczne/stacja/DOL012/12O3_43I-12SO2_43I-12NO2A-12PM10/dzienny/" <> (Date.utc_today |> to_string)
  @wro_user Application.get_env(:measurements, :wro_user)
  @wro_pswd Application.get_env(:measurements, :wro_pswd)

  def measurements() do
    @endpoint
    |> fetch()
    |> parse_result()
  end

  def fetch(url) do
    Logger.debug "GET: #{@endpoint}, using credentials '#{@wro_user}/#{@wro_pswd}'"

    hackney = [basic_auth: {@wro_user, @wro_pswd}, timeout: 10000]

    case HTTPoison.get(url, [], [ hackney: hackney ]) do
      {:ok, %HTTPoison.Response{status_code: 200} = response} ->
        case Utils.extract_content_type_from(response) do
          "application/json" ->
            response.body
          _ ->
            Logger.warn "Something's up! We're expecting JSON from: #{@endpoint}, using credentials #{@wro_user}/#{@wro_pswd}"
            IO.inspect response.body
            Utils.empty_json
        end

      {:ok, %HTTPoison.Response{status_code: 404} = response} ->
        Logger.warn "404 from: #{@endpoint}"
        IO.inspect response.body
        Utils.empty_json

      {:ok, %HTTPoison.Response{status_code: 401} = response} ->
        Logger.warn "401 from: #{@endpoint}"
        IO.inspect response.body
        Utils.empty_json

      {:ok, %HTTPoison.Response{status_code: 500} = response} ->
        Logger.warn "500 from: #{@endpoint}"
        IO.inspect response.body
        Utils.empty_json

      {:ok, response} ->
        Logger.warn "??? from: #{@endpoint}"
        IO.inspect response.body
        Utils.empty_json

      {:error, %HTTPoison.Error{reason: reason}} ->
        Logger.error "Error getting Wroclaw data: #{inspect reason}"
        Utils.empty_json
    end
  end

  def parse_result(json) do
    json_map =
      json
      |> Poison.decode!

    root = json_map["data"]["series"]

    case root do
      nil ->
        Measurements.unknown
      _ ->
        ozone_node      = node_for(root,"o3")
        particles_node  = node_for(root,"pm10")
        sulphite_node   = node_for(root,"so2")
        nitrogen_node   = node_for(root,"no2")

        %{ozone: calculate_average_from(ozone_node["data"]),
          particles: calculate_average_from(particles_node["data"]),
          sulphite: calculate_average_from(sulphite_node["data"]),
          nitrogen: calculate_average_from(nitrogen_node["data"])}
    end
  end

  def node_for(root, param_id) do
      root
      |> Enum.filter(&(&1["paramId"] == param_id))
      |> Enum.filter(&(&1["aggType"] == "A1h"))
      |> List.first
  end

  def calculate_average_from(data) do
    sum = Enum.reduce(data, 0, fn(d, acc) -> String.to_float(Enum.at(d, 1)) + acc end)

    (sum / length(data))
    |> round
    |> to_string
  end
end
