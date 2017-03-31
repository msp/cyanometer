defmodule Cyanometer.TestHelpers do
  alias Cyanometer.Repo
  alias Cyanometer.Location
  require Logger

  @default_location %Location{country: "Great Britain", city: "London", place: "Shoreditch"}

  def insert_image(attrs \\ %{}) do

    existing_location = Repo.get_by(Location,
                                    country: @default_location.country,
                                    city: @default_location.city,
                                    place: @default_location.place)

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

    changes = Dict.merge(%{
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
    changes = Dict.merge(%{
      air_pollution_index: "20",
      icon: "sun",
      taken_at: :calendar.universal_time(),
      }, attrs)


    %Cyanometer.EnvironmentalData{}
      |> Cyanometer.EnvironmentalData.changeset(changes)
      |> Repo.insert!()
  end

  def insert_location(attrs \\ %{}) do
    changes = Dict.merge(%{
      country: "Test country",
      city: "Test city",
      place: "Test place",
      }, attrs)


    %Cyanometer.Location{}
      |> Cyanometer.Location.changeset(changes)
      |> Repo.insert!()
  end
end
