defmodule Cyanometer.Repo.Migrations.AddLocationToEnvData do
  use Ecto.Migration

  def change do
    alter table(:environmental_datas) do
      add :location_id, references(:locations, on_delete: :delete_all)
    end

    create index(:environmental_datas, [:location_id])

    drop unique_index(:environmental_datas, [:taken_at])
    create unique_index(:environmental_datas, [:taken_at, :location_id])
  end
end
