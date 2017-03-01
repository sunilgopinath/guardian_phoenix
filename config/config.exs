# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :guardian_phoenix,
  ecto_repos: [GuardianPhoenix.Repo]

# Configures the endpoint
config :guardian_phoenix, GuardianPhoenix.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iIXKP0GjwWY9DU9U9xg3en+g3DpXTYJK4RaN0WMoQ/0zG/2E3fFlBySe5X+O5VwE",
  render_errors: [view: GuardianPhoenix.ErrorView, accepts: ~w(json)],
  pubsub: [name: GuardianPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  issuer: "GuardianPhoenix",
  ttl: { 30, :days },
  secret_key: "DhLS9M9DrMgFIKDSnxrj7bNOsxJXgzWrp2iFlrndoUUC2Z7RJQ9zH12Bg2BV/V66",
  serializer: GuardianPhoenix.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
