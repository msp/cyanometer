defmodule Cyanometer.EnvironmentalData do
  use Cyanometer.Web, :model

  @derive {Poison.Encoder, only: [:id, :air_pollution_index, :icon, :taken_at, :location_id]}
  schema "environmental_datas" do
    field :air_pollution_index, :string
    field :icon, :string
    field :taken_at, Ecto.DateTime

    belongs_to :location, Cyanometer.Location

    timestamps()
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:air_pollution_index, :icon, :taken_at, :location_id])
    |> validate_required([:air_pollution_index, :icon, :taken_at, :location_id])
    |> unique_constraint(:taken_at, name: :environmental_datas_taken_at_location_id_index)
    |> validate_length(:air_pollution_index, min: 1, max: 20)
    |> validate_inclusion(:icon, ~w(car factory sun house), [])
  end

end
