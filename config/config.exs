# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :cyanometer, Cyanometer.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+NTiQnSZtTW1YPppShvOs5E44/qhGUAiujGIa8E1CV4//aP8Tt1AASge+Bb0cHMP",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Cyanometer.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :cyanometer_migrator,
  source_bucket: "cyanometer",
  country: "Slovenia",
  city: "Ljubljana",
  place: "Central-Square"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

# 1.2 upgrade
config :cyanometer, ecto_repos: [Cyanometer.Repo]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
