defmodule ItalyHousehold.Policy do
  use Ecto.Schema
  import Ecto.Changeset

  schema "policies" do
    has_one(:engine_policy, PolicyOperationsEngine.Policy)
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
