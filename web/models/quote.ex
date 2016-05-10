defmodule Slarcher.Quote do
  use Slarcher.Web, :model

  schema "quotes" do
    field :content, :string
    belongs_to :character, Slarcher.Character

    timestamps
  end

  @allowed_fields ~w(content character_id)
  # @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :invalid) do
    model
    |> cast(params, @allowed_fields)
    |> validate_required [:content, :character_id]
  end
end
