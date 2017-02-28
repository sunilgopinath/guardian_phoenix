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


  def find_by_email(email) do
    from a in __MODULE__,
    where: a.email == ^email
  end

  defp put_pass_hash(changeset) do
    password = changeset.changes.password
    put_change(changeset, :password_digest, Comeonin.Bcrypt.hashpwsalt(password))
  end
end
