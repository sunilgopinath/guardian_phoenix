defmodule GuardianPhoenix.Router do
  use GuardianPhoenix.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GuardianPhoenix do
    pipe_through :api

    resources "/articles", ArticleController, only: [:index, :create, :show]
  end
end
