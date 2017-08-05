defmodule WroclawMock do
  @behaviour City

  def measurements do
    %{ozone: "wro-oz-10", particles: "wro-par-20", sulphite: "wro-sul-30", nitrogen: "wro-nit-40"}
  end

  def fetch(_url) do
  end

  def parse_result(_xml) do
  end
end
