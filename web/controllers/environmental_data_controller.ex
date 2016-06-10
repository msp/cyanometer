defmodule Cyanometer.EnvironmentalDataController do
  use Cyanometer.Web, :controller
  require Logger
  alias Cyanometer.EnvironmentalData

  def index(conn, _params) do
    environmental_datas = Repo.all(from ed in EnvironmentalData, limit: 24, order_by: [desc: ed.taken_at])
    json(conn, environmental_datas)
  end

  def create(conn, params) do
    Logger.debug "MSP create [#{params["taken_at"]}]"
    Logger.debug "MSP create [#{params["air_pollution_index"]}]"
    Logger.debug "MSP create [#{params["icon"]}]"

    changeset = EnvironmentalData.changeset(%EnvironmentalData{}, params)

    case Repo.insert(changeset) do
      {:ok, ed} ->
        Logger.debug "OK"
        json(conn, %{status: "ok", message: "inserted #{ed.taken_at} sucessfully"})
      {:error, changeset} ->
        Logger.debug "ERROR changeset valid? #{changeset.valid?}"

        errors = Enum.map(changeset.errors, fn {field, detail} ->
          %{
            source: %{ pointer: "/data/attributes/#{field}" },
            title: "Invalid Attribute",
            detail: render_detail(detail)
          }
        end)
        json(conn, %{status: "error", detail: errors})
    end
  end

  def render_detail({message, values}) do
    Enum.reduce values, message, fn {k, v}, acc ->
      String.replace(acc, "%{#{k}}", to_string(v))
    end
  end

  def render_detail(message) do
    message
  end
end
