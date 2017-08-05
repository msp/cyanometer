defmodule City do
  @callback measurements :: any
  @callback fetch(String.t) :: any
  @callback parse_result(String.t) :: any
end
