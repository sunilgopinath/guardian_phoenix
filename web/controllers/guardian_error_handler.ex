defmodule GuardianPhoenix.GuardianErrorHandler do
  use GuardianPhoenix.Web, :controller
  alias GuardianPhoenix.GuardianErrorView
  def unauthenticated(conn, _params) do
      conn
      |> put_status(:forbidden)
      |> render(GuardianErrorView, :forbidden)
    end
end
