defmodule GuardianPhoenix.Article do
  use GuardianPhoenix.Web, :model

  schema "articles" do
    field :title, :string
    field :url, :string
    field :categories, :string
    belongs_to :account, GuardianPhoenix.Account

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :url, :categories])
    |> validate_required([:title, :url, :categories])
  end
end
