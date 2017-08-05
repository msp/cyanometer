defmodule Cyanometer.Repo.Migrations.NotNullLocationFields do
  use Ecto.Migration

  def change do
    alter table(:locations) do
      modify :country, :string, null: false
      modify :city, :string, null: false
      modify :place, :string, null: false
    end
  end
end
