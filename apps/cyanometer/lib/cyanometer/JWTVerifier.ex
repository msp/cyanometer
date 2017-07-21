defmodule Cyanometer.JWTVerifier do
  import Joken
  import Plug.Conn
  alias Joken.Token
  require Logger

  @jwt_secret Application.get_env(:cyanometer, Cyanometer.Endpoint)[:jwt_secret]

  @doc """
  Adapted from the Joken Plug which I couldn't get working:

  https://github.com/bryanjos/joken/blob/master/lib/joken/plug.ex
  """
  def init(opts) do
    verify   = get_verify(opts)
    on_error = Keyword.get(opts, :on_error, &Joken.Plug.default_on_error/2)
    {verify, on_error}
  end

  @doc false
  def call(conn, {verify, on_error}) do
    conn = if Map.has_key?(conn.private, :joken_verify) do
      conn
    else
      set_joken_verify(conn, verify)
    end

    conn = if Map.has_key?(conn.private, :joken_on_error) do
      conn
    else
      put_private(conn, :joken_on_error, on_error)
    end

    if Map.get(conn.private, :joken_skip, false) do
      conn
    else
      parse_auth(conn, get_req_header(conn, "authorization"))
    end
  end

  defp get_verify(options) do
    case Keyword.take(options, [:verify, :on_verifying]) do
      [verify: verify] -> verify
      [verify: verify, on_verifying: _] ->
        warn_on_verifying()
        verify
      [on_verifying: verify] ->
        warn_on_verifying()
        verify
      [] ->
        warn_supply_verify_function()
        nil
    end
  end

  defp warn_on_verifying do
    Logger.warn "on_verifying is deprecated for the Joken plug and will be removed in a future version. Please use verify instead."
  end

  defp warn_supply_verify_function do
    # Logger.warn "You need to supply a verify function to the Joken token."
  end

  defp set_joken_verify(conn, verify) do
    case conn.private do
      %{joken_on_verifying: deprecated_verify} ->
        warn_on_verifying()
        put_private(conn, :joken_verify, deprecated_verify)
      _ ->
        put_private(conn, :joken_verify, verify)
    end
  end

  defp parse_auth(conn, ["Bearer " <> incoming_token]) do
    if Mix.env != :test do
      Logger.warn "--------------------------------------------------------------"
      Logger.warn Mix.env
      Logger.warn "--------------------------------------------------------------"
      Logger.warn "[#{incoming_token}]"
      Logger.warn "--------------------------------------------------------------"
      Logger.warn "[#{System.get_env("JWT_SECRET")}]"
      Logger.warn "--------------------------------------------------------------"
      Logger.warn "[#{@jwt_secret}]"
      Logger.warn "--------------------------------------------------------------"
    end
    verified_token =
      incoming_token
      |> token
      |> with_signer(hs256(System.get_env("JWT_SECRET") || @jwt_secret))
      |> verify

    evaluate(conn, verified_token)
  end

  defp parse_auth(conn, _header) do
    send_401(conn, "Unauthorized")
  end

  defp evaluate(conn, %Token{error: nil} = token) do
    assign(conn, :joken_claims, get_claims(token))
  end
  defp evaluate(conn, %Token{error: message}) do
    send_401(conn, message)
  end

  defp send_401(conn, message) do
    on_error = conn.private[:joken_on_error]

    {conn, message} = case on_error.(conn, message) do
      {conn, map} when is_map(map) ->
        create_json_response(conn, map)
      response ->
        response
    end

    conn
    |> send_resp(401, message)
    |> halt
  end

  defp create_json_response(conn, map) do
    conn = put_resp_content_type(conn, "application/json")
    json = Poison.encode!(map)
    {conn, json}
  end

  @doc false
  def default_on_error(conn, message) do
    {conn, message}
  end
end
