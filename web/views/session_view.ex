defmodule GuardianPhoenix.SessionView do
  use GuardianPhoenix.Web, :view

  def render("login.json", %{jwt: jwt}) do
    %{ jwt: jwt }
  end
end
