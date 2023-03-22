defmodule AuthService.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :address, :string
    field :full_name, :string
    field :role, :string

    belongs_to :account, AuthService.Accounts.Account

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:account_id, :full_name, :address, :role])
    |> validate_required([:account_id])
  end
end
