defmodule Cyanometer.EnvironmentalData do
  use Cyanometer.Web, :model

  @derive {Poison.Encoder, only: [:id, :air_pollution_index, :icon, :taken_at]}
  schema "environmental_datas" do
    field :air_pollution_index, :string
    field :icon, :string
    field :taken_at, Ecto.DateTime

    timestamps
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(air_pollution_index icon taken_at), [])
    |> unique_constraint(:taken_at)
    |> validate_length(:air_pollution_index, min: 1, max: 20)
    |> validate_inclusion(:icon, ~w(car factory sun house), [])
  end

end
