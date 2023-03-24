defmodule AuthServiceWeb.Auth.Pipeline do
  @moduledoc """

  A module for the plugin that wraps each request (which is in the right scope) and checks that
  the authorized user's session is valid.

  """

  use Guardian.Plug.Pipeline,
    otp_app: :auth_service,
    module: AuthServiceWeb.Auth.Guardian,
    error_handler: AuthServiceWeb.Auth.GuardianErrorHandler

  plug Guardian.Plug.VerifySession
  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
