defmodule AuthServiceWeb.Router do
  use AuthServiceWeb, :router
  use Plug.ErrorHandler

  defp handle_errors(conn, %{reason: %Phoenix.Router.NoRouteError{message: message}}) do
    conn
    |> json(%{errors: message})
    |> halt()
  end

  defp handle_errors(conn, %{reason: %{message: message}}) do
    conn
    |> json(%{errors: message})
    |> halt()
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
  end

  pipeline :auth do
    plug AuthServiceWeb.Auth.Pipeline
    plug AuthServiceWeb.Auth.SetAccount
  end

  scope "/api", AuthServiceWeb do
    pipe_through :api

    get "/", DefaultController, :index
    post "/accounts/create", AccountController, :create
    post "/accounts/sign_in", AccountController, :sign_in
  end

  scope "/api", AuthServiceWeb do
    pipe_through [:api, :auth]

    get "/accounts/by_id/:id", AccountController, :show
    get "/accounts/sign_out", AccountController, :sign_out
    post "/accounts/update", AccountController, :update
    get "/accounts/check_auth", AccountController, :check_auth
  end
end
