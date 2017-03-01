defmodule GuardianPhoenix.Router do
  use GuardianPhoenix.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  scope "/api", GuardianPhoenix do
    pipe_through :api

    resources "/articles", ArticleController, only: [:index, :create, :show]
    post "/login", SessionController, :create
  end
end
