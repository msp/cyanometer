use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :cyanometer, Cyanometer.Endpoint,
  http: [port: 4001],
  server: false,
  jwt_secret: "not-very-secret",
  measurements_service: MeasurementsMock,
  wro_user: "foo",
  wro_pswd: "bar"

# Print only warnings and errors during test
config :logger, level: :info

# Configure your database
config :cyanometer, Cyanometer.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "cyan-test",
  database: "cyanometer_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
