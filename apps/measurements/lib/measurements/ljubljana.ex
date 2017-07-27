defmodule Ljubljana do
  require Logger

  @behaviour City

  import SweetXml

  @endpoint "http://www.arso.gov.si/xml/zrak/ones_zrak_urni_podatki_zadnji.xml"

  def measurements() do
    @endpoint
    |> fetch()
    |> parse_result()
  end

  def fetch(url) do
    Logger.debug "GET: #{@endpoint}"

    case HTTPoison.get(url) do
      {:ok, response} ->
        case Utils.extract_content_type_from(response) do
          "application/xml" ->
            response.body
          _ ->
            Logger.warn "Something's up! We're expecting XML from: #{@endpoint}"
            IO.inspect response.body
            Utils.empty_xml
        end

      {:error, %HTTPoison.Error{reason: reason}} ->
        Logger.error "Error getting Ljubljana data: #{inspect reason}"
        Utils.empty_xml
    end

  end

  def parse_result(xml) do
    root = xml |> xpath(~x"//postaja[@sifra='E21']/text()") |> to_string

    case root do
      "" ->
        Measurements.unknown
      _ ->
        ozone     = xml |> xpath(~x"//postaja[@sifra='E21']/o3/text()")   |> to_string
        particles = xml |> xpath(~x"//postaja[@sifra='E21']/pm10/text()") |> to_string
        sulphite  = xml |> xpath(~x"//postaja[@sifra='E21']/so2/text()")  |> to_string
        nitrogen  = xml |> xpath(~x"//postaja[@sifra='E21']/no2/text()")  |> to_string

        %{ozone: ozone,
          particles: particles,
          sulphite: sulphite,
          nitrogen: nitrogen}
    end
  end
end
