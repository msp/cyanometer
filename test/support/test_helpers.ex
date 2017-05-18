defmodule Cyanometer.TestHelpers do
  import Plug.Conn
  import Joken

  alias Cyanometer.Repo
  alias Cyanometer.Location

  require Logger

  @default_location %Location{country: "Great Britain", city: "London", place: "Shoreditch", air_quality_source: "MET office", air_quality_link: "http://somewhere.com"}
  @jwt_secret Application.get_env(:cyanometer, Cyanometer.Endpoint)[:jwt_secret]

  def insert_image(attrs \\ %{}) do

    existing_location = Repo.get_by(Location,
                                    country: @default_location.country,
                                    city: @default_location.city,
                                    place: @default_location.place,
                                    air_quality_source: @default_location.air_quality_source)

    location =
      if attrs[:location_id] do
        Repo.get(Location, attrs[:location_id])
      else
        if existing_location do
          existing_location
        else
          Repo.insert!(@default_location)
        end
      end

    changes = Map.merge(%{
      s3_url: "https://s3.eu-central-1.amazonaws.com/cyanometer/#{Base.encode16(:crypto.strong_rand_bytes(8))}.jpg",
      taken_at: :calendar.universal_time(),
      blueness_index: "3",
      }, attrs)

    Ecto.build_assoc(location, :images, changes)
      |> Cyanometer.Image.changeset(changes)
      |> Repo.insert!()
      |> Repo.preload(:location)
  end

  def insert_environmental_data(attrs \\ %{}) do
    changes = Map.merge(%{
      air_pollution_index: "20",
      icon: "sun",
      taken_at: :calendar.universal_time(),
      }, attrs)


    %Cyanometer.EnvironmentalData{}
      |> Cyanometer.EnvironmentalData.changeset(changes)
      |> Repo.insert!()
  end

  def insert_location(attrs \\ %{}) do
    changes = Map.merge(%{
      country: "Test country",
      city: "Test city",
      place: "Test place",
      air_quality_source: "Test air quality source",
      air_quality_link: "http://somewhere.com"
      }, attrs)


    %Cyanometer.Location{}
      |> Cyanometer.Location.changeset(changes)
      |> Repo.insert!()
  end

  def set_json_header(%{conn: conn}) do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  def set_authorised_header(%{conn: conn}) do
    my_token = %{}
      |> token
      |> with_signer(hs256(@jwt_secret))
      |> sign
      |> get_compact

    {:ok, conn: put_req_header(conn, "authorization", "Bearer #{my_token}")}
  end

  def set_unauthorised_header(%{conn: conn}) do
    my_token = %{}
      |> token
      |> with_signer(hs256("this-is-not-our-secret"))
      |> sign
      |> get_compact

    {:ok, conn: put_req_header(conn, "authorization", "Bearer #{my_token}")}
  end
end
