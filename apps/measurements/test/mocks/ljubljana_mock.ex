defmodule LjubljanaMock do
  @behaviour City

  def measurements do
    %{ozone: "lju-oz-10", particles: "lju-par-20", sulphite: "lju-sul-30", nitrogen: "lju-nit-40"}
  end

  def fetch(_url) do
  end

  def parse_result(_xml) do
  end
end
