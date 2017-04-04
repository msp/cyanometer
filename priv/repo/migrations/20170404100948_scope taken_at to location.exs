defmodule :"Elixir.Cyanometer.Repo.Migrations.Scope takenAt to location" do
  use Ecto.Migration

  def change do
    drop unique_index(:images, [:taken_at])
    create unique_index(:images, [:taken_at, :location_id])
  end
end
