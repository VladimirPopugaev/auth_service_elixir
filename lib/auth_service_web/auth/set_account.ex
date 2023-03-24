defmodule AuthServiceWeb.Auth.SetAccount do
  @moduledoc """

  Module for the plugin that checks if the user is authorized in the current session and the id is
  saved in the connection assigns.

  """

  import Plug.Conn
  alias AuthServiceWeb.Auth.ErrorResponse
  alias AuthService.Accounts

  def init(_options) do
  end

  def call(conn, _options) do
    if conn.assigns[:account_id] do
      conn
    else
      account_id = get_session(conn, :account_id)

      if account_id == nil, do: raise(ErrorResponse.Unauthorized)

      account = Accounts.get_account!(account_id)

      cond do
        account_id && account -> assign(conn, :account, account)
        true -> assign(conn, :account, nil)
      end
    end
  end
end
