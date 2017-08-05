use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :cyanometer, Cyanometer.Endpoint,
  http: [port: 4001],
  server: false,
  jwt_secret: "not-very-secret",
  measurements_service: MeasurementsMock

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
if System.get_env("DATABASE_URL") do
  # Heroku
  config :cyanometer, Cyanometer.Repo,
    adapter: Ecto.Adapters.Postgres,
    url: System.get_env("DATABASE_URL"),
    pool: Ecto.Adapters.SQL.Sandbox
else
  # Local DB Config Here
  config :cyanometer, Cyanometer.Repo,
    adapter: Ecto.Adapters.Postgres,
    username: "cyan-test",
    database: "cyanometer_test",
    hostname: "localhost",
    pool: Ecto.Adapters.SQL.Sandbox
end
