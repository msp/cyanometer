defmodule Measurements do
  import SweetXml
  use GenServer

  ############################## Client ########################################
  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(state) do
    schedule_work()
    {:ok, Map.merge(state, %{ljubljana: get_ljubljana() })}
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

  def unknown do
    %{ozone: "??", particles: "??", sulphite: "??", nitrogen: "??"}
  end

  ############################## Server ########################################
  def handle_call(:get_ljubljana, _from, state) do
    {:reply, state[:ljubljana], state}
  end

  def handle_info(:work, state) do
    schedule_work()

    {:noreply, Map.merge(state, %{ljubljana: get_ljubljana()} )}
  end

  ############################## Private #######################################
  defp schedule_work() do
    Process.send_after(self(), :work, 1 * 60 * 1000)
  end

  defp get_ljubljana() do
    "http://www.arso.gov.si/xml/zrak/ones_zrak_urni_podatki_zadnji.xml"
    |> fetch_ljubljana_xml()
    |> parse_ljubljana()
  end

  defp fetch_ljubljana_xml(url) do
    {:ok, {_, _, body}} = :httpc.request(String.to_char_list(url))
    body
  end

  defp parse_ljubljana(node) do
    # <postaja sifra="E21" ge_dolzina="14.512704" ge_sirina="46.065497" nadm_visina="299">
    #  <merilno_mesto>Ljubljana Bežigrad</merilno_mesto>
    #  <datum_od>2016-06-11 00:00</datum_od>
    #  <datum_do>2016-06-11 01:00</datum_do>
    #  <so2>5</so2>
    #  <co>0.2</co>
    #  <o3>39</o3>
    #  <no2>32</no2>
    #  <pm10>16</pm10>
    # </postaja>

    ozone     = node |> xpath(~x"//postaja[@sifra='E21']/o3/text()")
    particles = node |> xpath(~x"//postaja[@sifra='E21']/pm10/text()")
    sulphite  = node |> xpath(~x"//postaja[@sifra='E21']/so2/text()")
    nitrogen  = node |> xpath(~x"//postaja[@sifra='E21']/no2/text()")

    %{ozone: ozone,
      particles: particles,
      sulphite: sulphite,
      nitrogen: nitrogen}
  end
end
