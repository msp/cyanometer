use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :cyanometer, Cyanometer.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin",
             cd: Path.expand("../", __DIR__)]],
  jwt_secret: "not-very-secret"

# Watch static and templates for browser reloading.
config :cyanometer, Cyanometer.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development.
# Do not configure such in production as keeping
# and calculating stacktraces is usually expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :cyanometer, Cyanometer.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "cyan-dev",
  database: "cyanometer_dev",
  hostname: "localhost",
  pool_size: 4

config :cyanometer_migrator,
  source_bucket: "script-test",
  target_bucket: "script-testV2",
  country: "Slovenia",
  city: "Ljubljana",
  place: "Central-Square"

config :ex_aws,
  access_key_id: [{:system, "AWS_ACCESS_KEY_ID"}, :instance_role],
  secret_access_key: [{:system, "AWS_SECRET_ACCESS_KEY"}, :instance_role],
  region: "fakes3"

config :ex_aws, :s3,
  scheme: "http://",
  host: "localhost",
  port: 4567
