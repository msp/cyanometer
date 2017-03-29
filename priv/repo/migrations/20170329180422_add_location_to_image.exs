defmodule Cyanometer.Repo.Migrations.AddLocationToImage do
  use Ecto.Migration

  def change do
    alter table(:images) do
      add :location_id, references(:locations, on_delete: :delete_all)
    end

    create index(:images, [:location_id])
  end
end
