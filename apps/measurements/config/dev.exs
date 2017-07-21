use Mix.Config

config :measurements,
  ljubljana_client: Ljubljana,
  wroclaw_client: Wroclaw

import_config "dev.secret.exs"
