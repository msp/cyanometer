defmodule Ljubljana do
  @behaviour City

  import SweetXml

  @endpoint "http://www.arso.gov.si/xml/zrak/ones_zrak_urni_podatki_zadnji.xml"

  def measurements() do
    @endpoint
    |> fetch()
    |> parse_result()
  end

  def fetch(url) do
    {:ok, {_, _, body}} = :httpc.request(String.to_char_list(url))
    body
  end

  def parse_result(xml) do
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
