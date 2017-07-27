defmodule Measurements do
  use GenServer

  @timeout 2000
  @ljubljana_client Application.get_env(:measurements, :ljubljana_client)
  @wroclaw_client   Application.get_env(:measurements, :wroclaw_client)

  # works, but :/
  Code.require_file("test/mocks/ljubljana_mock.ex")
  Code.require_file("test/mocks/wroclaw_mock.ex")

  ################################# API ########################################
  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(state) do
    schedule_work()
    {:ok, Map.merge(state, %{ljubljana: measurements_for(@ljubljana_client),
                             wroclaw: measurements_for(@wroclaw_client)})}
  end

  def ljubljana do
    fetch_for(:ljubljana)
  end

  def wroclaw do
    fetch_for(:wroclaw)
  end

  def unknown do
    %{ozone: "??", particles: "??", sulphite: "??", nitrogen: "??"}
  end

  def fetch_for(city) do
    try do
      GenServer.call(__MODULE__, {:get_city, city}, @timeout)
    catch
      :exit, err ->
        IO.puts "Bang! get_city(#{city}) exited abnormally.. Keep calm."
        IO.inspect err
        Measurements.unknown
    end
  end

  ############################## Server ########################################
  def handle_call({:get_city, :ljubljana}, _from, state) do
    {:reply, state[:ljubljana], state}
  end

  def handle_call({:get_city, :wroclaw}, _from, state) do
    {:reply, state[:wroclaw], state}
  end

  def handle_call({:get_city, _}, _from, state) do
    {:reply, Measurements.unknown, state}
  end

  def handle_info(:work, state) do
    schedule_work()

    {:noreply, Map.merge(state, %{ljubljana: measurements_for(Ljubljana),
                                  wroclaw: measurements_for(Wroclaw)} )}
  end

  ############################## Private #######################################
  defp schedule_work() do
    Process.send_after(self(), :work, 1 * 60 * 1000)
  end

  defp measurements_for(city) do
    city.measurements
  end
end
