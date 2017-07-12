defmodule Cyanometer.Repo.Migrations.AddAirPollutionIndexAndIconToImage do
  use Ecto.Migration

  def change do
    alter table(:images) do
      add :air_pollution_index, :string, null: false, default: "1"
      add :icon, :string, null: false, default: "car"
    end
  end
end
