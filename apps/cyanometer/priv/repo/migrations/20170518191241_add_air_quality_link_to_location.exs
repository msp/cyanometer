defmodule Cyanometer.Repo.Migrations.AddAirQualityLinkToLocation do
  use Ecto.Migration

  import Ecto.Query
  alias Cyanometer.Location

  def change do
    alter table(:locations) do
      add :air_quality_link, :string
    end

    flush()

    from(l in Location, where: l.country == "Slovenia")
    |> Cyanometer.Repo.update_all(set: [air_quality_link: "http://www.arso.si"])

    from(l in Location, where: l.country == "Poland")
    |> Cyanometer.Repo.update_all(set: [air_quality_link: "http://www.gios.gov.pl/en/"])

    from(l in Location, where: is_nil(l.air_quality_link))
    |> Cyanometer.Repo.update_all(set: [air_quality_link: "http://google.com"])

    alter table(:locations) do
      modify :air_quality_link, :string, null: false
    end
  end
end
