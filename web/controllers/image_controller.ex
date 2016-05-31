defmodule Cyanometer.ImageController do
  use Cyanometer.Web, :controller
  require Logger

  alias Cyanometer.Image

  def create(conn, params) do
    Logger.debug "MSP create [#{params["taken_at"]}]"
    Logger.debug "MSP create [#{params["s3_url"]}]"
    Logger.debug "MSP create [#{params["blueness_index"]}]"
    # TODO MSP - review https://github.com/devinus/poison

    changeset = Image.changeset(%Image{}, params)

    case Repo.insert(changeset) do
      {:ok, image} ->
        Logger.debug "OK"
        json(conn, %{status: "ok", message: "inserted #{image.s3_url} sucessfully"})
      {:error, changeset} ->
        Logger.debug "ERROR changeset valid? #{changeset.valid?}"
        {:error, changeset}
        json(conn, %{status: "error"})
    end
  end
end
