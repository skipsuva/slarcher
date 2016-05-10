defmodule Slarcher.Character do
  use Slarcher.Web, :model

  schema "characters" do
    field :name, :string
    has_many :quotes, Slarcher.Quote

    timestamps
  end

  @allowed_fields ~w(name)
  # @required_fields ~w(name)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :invalid) do
    model
    |> cast(params, @allowed_fields)
    |> validate_required [:name]
  end
end
