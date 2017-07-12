defmodule Cyanometer.Repo.Migrations.CreateImage do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :s3_url, :string, null: false
      add :taken_at, :datetime, null: false 
      add :blueness_index, :string, null: false
      timestamps
    end

    create unique_index(:images, [:taken_at])
  end
end
