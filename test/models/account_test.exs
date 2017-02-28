defmodule GuardianPhoenix.AccountTest do
  use GuardianPhoenix.ModelCase

  alias GuardianPhoenix.Account

  @valid_attrs %{email: "some content", password_diges: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Account.changeset(%Account{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Account.changeset(%Account{}, @invalid_attrs)
    refute changeset.valid?
  end
end
