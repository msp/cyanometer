use Mix.Config

config :measurements,
  ljubljana_client: LjubljanaMock,
  wroclaw_client: WroclawMock

config :logger, level: :warn

import_config "test.secret.exs"
