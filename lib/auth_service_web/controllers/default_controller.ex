defmodule AuthServiceWeb.DefaultController do
  use AuthServiceWeb, :controller

  def index(conn, _params) do
    text(conn, "The auth service is LIVE #{Mix.env()}")
  end
end
