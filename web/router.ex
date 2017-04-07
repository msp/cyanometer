defmodule Cyanometer.Router do
  use Cyanometer.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", Cyanometer do
    pipe_through :browser

    get "/", PageController, :index
    get "/location/:id", PageController, :location
    get "/archive", PageController, :archive
    get "/test", PageController, :test
    get "/debug", ImageController, :debug
  end

  pipeline :api do
    plug Cyanometer.JWTVerifier
    plug :accepts, ["json"]
  end

  scope "/api", Cyanometer do
    pipe_through :api

    # public ###################################################################
    ############################################################################
    resources "/locations", LocationController, private: %{joken_skip: true}, only: [:index, :show] do
      resources "/images", ImageController, only: [:index, :show]
    end

    resources "/images", ImageController, private: %{joken_skip: true}, only: [:index, :show]
    get "/landing/:count", ImageController, :landing, private: %{joken_skip: true}

    resources "/environmental_data", EnvironmentalDataController, private: %{joken_skip: true}, only: [:index, :show]
    get "/measurements", MeasurementsController, :measurements, private: %{joken_skip: true}

    # restricted ###############################################################
    ############################################################################
    resources "/locations", LocationController, only: [:create, :update, :delete] do
      resources "/images", ImageController, only: [:create, :update, :delete]
    end

    resources "/images", ImageController, only: [:create, :update, :delete]
    resources "/environmental_data", EnvironmentalDataController, only: [:create, :index]
  end
end
