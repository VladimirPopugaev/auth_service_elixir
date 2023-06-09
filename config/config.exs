# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :auth_service,
  ecto_repos: [AuthService.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :auth_service, AuthServiceWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: AuthServiceWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: AuthService.PubSub,
  live_view: [signing_salt: "mFq48Yy9"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :auth_service, AuthServiceWeb.Auth.Guardian,
  issuer: "auth_service",
  secret_key: "I5Di+EMYHPIbrOYOIgjUBL/x9Kr8toASfDDstFc/WfCglLqEBEvoaHZwAGznjZgY"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :guardian, Guardian.DB,
  repo: AuthService.Repo,
  schema_name: "guardian_tokens",
  sweep_interval: 60

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
