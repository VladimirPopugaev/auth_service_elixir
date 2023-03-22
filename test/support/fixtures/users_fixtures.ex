defmodule AuthService.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AuthService.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        address: "some address",
        full_name: "some full_name",
        role: "some role"
      })
      |> AuthService.Users.create_user()

    user
  end
end
