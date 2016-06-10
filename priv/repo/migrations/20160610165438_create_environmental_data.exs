defmodule Cyanometer.Repo.Migrations.CreateEnvironmentalData do
  use Ecto.Migration

  def change do
    create table(:environmental_datas) do
      add :air_pollution_index, :string, null: false
      add :icon, :string, null: false
      add :taken_at, :datetime, null: false
      timestamps
    end

    create unique_index(:environmental_datas, [:taken_at])
  end
end
