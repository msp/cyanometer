defmodule Measurements do
  import SweetXml
  use GenServer

  @ljubljana_endpoint "http://www.arso.gov.si/xml/zrak/ones_zrak_urni_podatki_zadnji.xml"
  @wroclaw_endpoint "http://air.wroclaw.pios.gov.pl/dane-pomiarowe/api/automatyczne/stacja/DOL012/12O3_43I-12SO2_43I-12NO2A-12PM10/dzienny/"

  @wro_user Application.get_env(:cyanometer, Cyanometer.Endpoint)[:wro_user]
  @wro_pswd Application.get_env(:cyanometer, Cyanometer.Endpoint)[:wro_pswd]

  ############################## Client ########################################
  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(state) do
    schedule_work()
    {:ok, Map.merge(state, %{ljubljana: get_ljubljana(),
                             wroclaw: get_wroclaw()})}
  end

  def ljubljana do
    try do
      GenServer.call(__MODULE__, :get_ljubljana, 2000)
    catch
      :exit, _ ->
        IO.puts "Bang! get_ljubljana exited abnormally.. Keep calm."
        Measurements.unknown
    end
  end

  def wroclaw do
    try do
      GenServer.call(__MODULE__, :get_wroclaw, 2000)
    catch
      :exit, _ ->
        IO.puts "Bang! get_wroclaw exited abnormally.. Keep calm."
        Measurements.unknown
    end
  end

  def unknown do
    %{ozone: "??", particles: "??", sulphite: "??", nitrogen: "??"}
  end

  def parse_ljubljana(xml) do
    ozone     = xml |> xpath(~x"//postaja[@sifra='E21']/o3/text()")   |> to_string
    particles = xml |> xpath(~x"//postaja[@sifra='E21']/pm10/text()") |> to_string
    sulphite  = xml |> xpath(~x"//postaja[@sifra='E21']/so2/text()")  |> to_string
    nitrogen  = xml |> xpath(~x"//postaja[@sifra='E21']/no2/text()")  |> to_string

    %{ozone: ozone,
      particles: particles,
      sulphite: sulphite,
      nitrogen: nitrogen}
  end

  def parse_wroclaw(json) do
    json_map =
      json
      |> Poison.decode!

    root = json_map["data"]["series"]

    ozone_node      = node_for(root,"o3")
    particles_node  = node_for(root,"pm10")
    sulphite_node   = node_for(root,"so2")
    nitrogen_node   = node_for(root,"no2")

    %{ozone: calculate_average_from(ozone_node["data"]),
      particles: calculate_average_from(particles_node["data"]),
      sulphite: calculate_average_from(sulphite_node["data"]),
      nitrogen: calculate_average_from(nitrogen_node["data"])}
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

  ############################## Server ########################################
  def handle_call(:get_ljubljana, _from, state) do
    {:reply, state[:ljubljana], state}
  end

  def handle_call(:get_wroclaw, _from, state) do
    {:reply, state[:wroclaw], state}
  end

  def handle_info(:work, state) do
    schedule_work()

    {:noreply, Map.merge(state, %{ljubljana: get_ljubljana(),
                                  wroclaw: get_wroclaw()} )}
  end

  ############################## Private #######################################
  defp schedule_work() do
    Process.send_after(self(), :work, 1 * 60 * 1000)
  end

  defp get_ljubljana() do
    @ljubljana_endpoint
    |> fetch_ljubljana_xml()
    |> parse_ljubljana()
  end

  defp get_wroclaw() do
    today = Date.utc_today |> to_string

    @wroclaw_endpoint <> today
    |> fetch_wroclaw_json()
    |> parse_wroclaw()
  end

  defp fetch_ljubljana_xml(url) do
    {:ok, {_, _, body}} = :httpc.request(String.to_char_list(url))
    body
  end

  defp fetch_wroclaw_json(url) do
    hackney = [basic_auth: {@wro_user, @wro_pswd}]
    {:ok, response} = HTTPoison.get(url, [], [ hackney: hackney ])
    response.body
  end
end
