defmodule Cyanometer.Image do
  use Cyanometer.Web, :model

  @derive {Poison.Encoder, only: [:id, :s3_url, :taken_at, :blueness_index, :location_id]}
  schema "images" do
    field :s3_url, :string
    field :taken_at, Ecto.DateTime
    field :blueness_index, :string

    belongs_to :location, Cyanometer.Location

    timestamps
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(taken_at s3_url blueness_index), [])
    |> unique_constraint(:s3_url)
    |> unique_constraint(:taken_at)
    # |> validate_required(:location_id) TODO
    |> validate_length(:s3_url, min: 9, max: 200)
    |> validate_length(:blueness_index, min: 1, max: 20)
    |> validate_url(:s3_url)
    |> validate_s3(:s3_url)
  end

  def validate_url(changeset, field, options \\ []) do
    validate_change changeset, field, fn _, url ->
      case url |> String.to_char_list |> :http_uri.parse do
        {:ok, _} -> []
        {:error, msg} -> [{field, options[:message] || "invalid url: #{inspect msg}"}]
      end
    end
  end

  def validate_s3(changeset, field, options \\ []) do
    url = get_field(changeset, field)

    if (url && String.length(url) > 0) do
      uri = URI.parse(url)

      if uri.host != "s3.eu-central-1.amazonaws.com" do
        changeset = add_error(changeset, field, "Not our S3 host: #{url}")
      end

      paths = String.split(uri.path, "/")
      if Enum.at(paths, 1) != "cyanometer" do
        changeset = add_error(changeset, field, "Not our S3 host (bad path): #{url} #{inspect paths}")
      end
    end

    changeset
  end
end
