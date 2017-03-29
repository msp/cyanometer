# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Cyanometer.Repo.insert!(%Cyanometer.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Cyanometer.Repo
alias Cyanometer.Location

require Logger

locations =  [
  %Location{city: "Ljubljana", country: "Slovenia", place: "Central Square"}
]

for location <- locations do
  existing_location =  Repo.get_by(Location, country: location.country, city: location.city, place: location.place)

  unless existing_location do
    Repo.insert!(location)
  end
end
