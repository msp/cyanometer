defmodule Cyanometer.Image do
  use Cyanometer.Web, :model

  @derive {Poison.Encoder, only: [:id, :s3_url, :taken_at, :blueness_index]}
  schema "images" do
    field :s3_url, :string
    field :taken_at, Ecto.DateTime
    field :blueness_index, :string
    timestamps
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(taken_at s3_url blueness_index), [])
    |> unique_constraint(:s3_url)
    |> unique_constraint(:taken_at)
    |> validate_length(:s3_url, min: 9, max: 200)
    |> validate_length(:blueness_index, min: 1, max: 20)
  end

end
