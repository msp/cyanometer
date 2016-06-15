defmodule Cyanometer.MeasurementsController do
  use Cyanometer.Web, :controller
  require Logger

  def measurements(conn, _params) do
    redirect conn, external: "/images/ones_zrak_urni_podatki_zadnji.xml"
  end
end
