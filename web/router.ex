defmodule Cyanometer.Router do
  use Cyanometer.Web, :router

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

  scope "/", Cyanometer do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/test", PageController, :test

  end

  # Other scopes may use custom stacks.
  scope "/api", Cyanometer do
    pipe_through :api
    resources "/images", ImageController, only: [:create, :index]
  end
end
