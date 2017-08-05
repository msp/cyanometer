use Mix.Config

config :measurements,
  wro_user: System.get_env("WRO_USER"),
  wro_pswd: System.get_env("WRO_PSWD")
