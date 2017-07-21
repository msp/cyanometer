use Mix.Config

config :measurements,
  ljubljana_client: LjubljanaMock,
  wroclaw_client: WroclawMock

import_config "test.secret.exs"
