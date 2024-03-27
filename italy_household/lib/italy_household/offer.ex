defmodule ItalyHousehold.Offer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "offers" do
    has_one(:engine_offer, PolicyOperationsEngine.Offer)
    field(:name, :string)
  end

  def changeset(attrs \\ %{}) do
    %__MODULE__{}
    |> cast(attrs, [:name])
    |> validate_required(:name)
  end

  def new(attrs \\ %{}) do
    attrs
    |> changeset()
    |> apply_action(:new)
  end
end
