defmodule WeddingPlannerWeb.Router do
  use WeddingPlannerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WeddingPlannerWeb do
    pipe_through :browser

    resources "/client_identities", IdentityController
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", WeddingPlannerWeb do
  #   pipe_through :api
  # end
end
