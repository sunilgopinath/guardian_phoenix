defmodule GuardianPhoenix.Repo.Migrations.CreateArticle do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :title, :string
      add :url, :string
      add :categories, :string

      timestamps()
    end

  end
end
