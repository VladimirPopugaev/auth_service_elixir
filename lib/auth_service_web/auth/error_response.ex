defmodule AuthServiceWeb.Auth.ErrorResponse.Unauthorized do
  defexception message: "Unauthorized", plug_status: 401
end

defmodule AuthServiceWeb.Auth.ErrorResponse.Forbidden do
  defexception message: "Do not have access to this resource", plug_status: 403
end
