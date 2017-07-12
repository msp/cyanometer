defmodule Cyanometer.Location do
  use Cyanometer.Web, :model

  @derive {Poison.Encoder, only: [:id, :country, :city, :place, :air_quality_source, :air_quality_link]}
  schema "locations" do
    field :country, :string
    field :city, :string
    field :place, :string
    field :air_quality_source, :string
    field :air_quality_link, :string

    has_many :images, Cyanometer.Image

    timestamps()
  end

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:country, :city, :place, :air_quality_source, :air_quality_link])
    |> validate_required([:country, :city, :place, :air_quality_source, :air_quality_link])
    |> validate_url(:air_quality_link)
  end

  # TODO dry me
  def validate_url(changeset, field, options \\ []) do
    validate_change changeset, field, fn _, url ->
      case url |> String.to_char_list |> :http_uri.parse do
        {:ok, _} -> []
        {:error, msg} -> [{field, options[:message] || "invalid url: #{inspect msg}"}]
      end
    end
  end
end
