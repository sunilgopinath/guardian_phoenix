defmodule GuardianPhoenix.GuardianErrorView do
  use GuardianPhoenix.Web, :view
  def render("forbidden.json", _assigns) do
    %{message: "Forbidden"}
  end
end
