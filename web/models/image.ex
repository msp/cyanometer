defmodule Cyanometer.Image do
  use Cyanometer.Web, :model

  # enum :icon_type, [car: 0, factory: 1, sun: 2, house: 3]

  @derive {Poison.Encoder, only: [:s3_url, :taken_at, :blueness_index, :air_pollution_index, :icon]}
  schema "images" do
    field :s3_url, :string
    field :taken_at, Ecto.DateTime
    field :blueness_index, :string
    field :air_pollution_index, :string
    field :icon, :string
    timestamps
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(taken_at s3_url blueness_index air_pollution_index icon), [])
    |> unique_constraint(:s3_url)
    |> unique_constraint(:taken_at)
    |> validate_length(:s3_url, min: 9, max: 200)
    |> validate_length(:blueness_index, min: 1, max: 20)
    |> validate_length(:air_pollution_index, min: 1, max: 20)
    |> validate_inclusion(:icon, ~w(car factory sun house), [])
  end

end
