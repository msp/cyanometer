defmodule Cyanometer.Repo.Migrations.RemoveAirPollutionIndexAndIconFromImage do
  use Ecto.Migration

  def change do
    alter table(:images) do
      remove :air_pollution_index
      remove :icon
    end
  end
end
