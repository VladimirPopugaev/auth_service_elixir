defmodule AuthServiceWeb.AccountView do
  use AuthServiceWeb, :view
  alias AuthServiceWeb.AccountView

  def render("index.json", %{account: account}) do
    %{data: render_many(account, AccountView, "account.json")}
  end

  def render("show.json", %{account: account}) do
    %{data: render_one(account, AccountView, "account.json")}
  end

  def render("account.json", %{account: account}) do
    %{
      id: account.id,
      email: account.email,
      hash_password: account.hash_password
    }
  end

  def render("account_token.json", %{account: account, token: token}) do
    %{
      id: account.id,
      email: account.email,
      token: token
    }
  end

  def render("info.json", %{response: response}) do
    %{
      info: response
    }
  end
end
