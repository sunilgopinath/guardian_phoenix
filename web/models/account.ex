defmodule GuardianPhoenix.Account do
  use GuardianPhoenix.Web, :model

  schema "accounts" do
    field :email, :string
    field :password_digest, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password, :password_digest])
    |> validate_required([:email, :password])
    |> put_pass_hash
  end

  defp put_pass_hash(changeset) do
    password = changeset.changes.password
    put_change(changeset, :password_digest, String.reverse(password))
  end
end
