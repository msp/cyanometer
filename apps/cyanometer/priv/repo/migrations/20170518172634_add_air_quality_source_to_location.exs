defmodule Cyanometer.Repo.Migrations.AddAirQualitySourceToLocation do
  use Ecto.Migration

  import Ecto.Query
  alias Cyanometer.Location

  def change do
    alter table(:locations) do
      add :air_quality_source, :string
    end

    flush()

    from(l in Location, where: l.country == "Slovenia")
    |> Cyanometer.Repo.update_all(set: [air_quality_source: "ARSO Ljubljana Bežigrad"])

    from(l in Location, where: l.country == "Poland")
    |> Cyanometer.Repo.update_all(set: [air_quality_source: "Voivodship Inspectorates for Environmental Protection"])

    from(l in Location, where: is_nil(l.air_quality_source))
    |> Cyanometer.Repo.update_all(set: [air_quality_source: "unknown air quality source"])

    alter table(:locations) do
      modify :air_quality_source, :string, null: false
    end
  end
end
