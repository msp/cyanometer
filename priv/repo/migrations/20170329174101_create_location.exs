defmodule Cyanometer.Repo.Migrations.CreateLocation do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :country, :string
      add :city, :string
      add :place, :string

      timestamps
    end

  end
end
