# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :calc_phx,
  ecto_repos: [CalcPhx.Repo]

# Configures the endpoint
config :calc_phx, CalcPhxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XefK1SGyjTPgsrQ0zRKMTzVpvLRae4LqkODjxVg2q2pOmSLJdCXTTPM0o++9E7WA",
  render_errors: [view: CalcPhxWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CalcPhx.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
