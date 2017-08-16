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
    get "/location/:id/:location_name", PageController, :location
    get "/test", PageController, :test
    get "/debug", ImageController, :debug

    # 'About' site redirects as the wordpress code has not been updated :/
    get "/PageBuilder-V3/elements/images/Cyan/Cyanometer/Cyan_banner_2.jpg",    Redirector, external: "http://about.cyanometer.net/PageBuilder-V3/elements/images/Cyan/Cyanometer/Cyan_banner_2.jpg"
    get "/PageBuilder-V3/elements/images/Cyan/History/History4.jpg",            Redirector, external: "http://about.cyanometer.net/PageBuilder-V3/elements/images/Cyan/History/History4.jpg"
    get "/PageBuilder-V3/elements/images/Cyan/Monolith/cyano_web_01.jpg",       Redirector, external: "http://about.cyanometer.net/PageBuilder-V3/elements/images/Cyan/Monolith/cyano_web_01.jpg"
    get "/PageBuilder-V3/elements/images/Cyan/Location/1960s-nama-620x431.jpg", Redirector, external: "http://about.cyanometer.net/PageBuilder-V3/elements/images/Cyan/Location/1960s-nama-620x431.jpg"
    get "/PageBuilder-V3/elements/images/Cyan/Blue/bluesky1.jpg",               Redirector, external: "http://about.cyanometer.net/PageBuilder-V3/elements/images/Cyan/Blue/bluesky1.jpg"
    get "/PageBuilder-V3/elements/images/Cyan/Cyanometer/blue_gradient.jpg",    Redirector, external: "http://about.cyanometer.net/PageBuilder-V3/elements/images/Cyan/Cyanometer/blue_gradient.jpg"
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
      resources "/environmental_data", EnvironmentalDataController, only: [:index, :show]
    end

    resources "/images", ImageController, private: %{joken_skip: true}, only: [:index, :show]
    get "/landing/:count", ImageController, :landing, private: %{joken_skip: true}

    resources "/environmental_data", EnvironmentalDataController, private: %{joken_skip: true}, only: [:index, :show]
    get "/measurements", MeasurementsController, :measurements, private: %{joken_skip: true}

    # restricted ###############################################################
    ############################################################################
    resources "/locations", LocationController, only: [:create, :update, :delete] do
      resources "/images", ImageController, only: [:create, :update, :delete]
      resources "/environmental_data", EnvironmentalDataController, only: [:create, :update, :delete]
    end

    resources "/images", ImageController, only: [:create, :update, :delete]
    resources "/environmental_data", EnvironmentalDataController, only: [:create, :update, :delete]
  end
end
