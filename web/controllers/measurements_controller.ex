defmodule Cyanometer.MeasurementsController do
  use Cyanometer.Web, :controller
  require Logger

  def measurements(conn, _params) do
    redirect conn, external: "http://www.arso.gov.si/xml/zrak/ones_zrak_urni_podatki_zadnji.xml"
  end
end
