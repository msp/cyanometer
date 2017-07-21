defmodule LjubljanaMock do
  @behaviour City

  def measurements do
    %{ozone: "lju-oz-10", particles: "lju-par-20", sulphite: "lju-sul-30", nitrogen: "lju-nit-40"}
  end

  def fetch(url) do
  end

  def parse_result(xml) do
  end
end
