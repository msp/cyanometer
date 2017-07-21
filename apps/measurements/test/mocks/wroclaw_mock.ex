defmodule WroclawMock do
  @behaviour City

  def measurements do
    %{ozone: "wro-oz-10", particles: "wro-par-20", sulphite: "wro-sul-30", nitrogen: "wro-nit-40"}
  end

  def fetch(url) do
  end

  def parse_result(xml) do
  end
end
