defmodule PolicyOperationsEngine.Offer do
  use Ecto.Schema
  import Ecto.Changeset

  @derive Jason.Encoder
  embedded_schema do
    belongs_to(:offer, Application.compile_env!(:policy_operations_engine, :offer_module))
  end

  def changeset(attrs \\ %{}) do
    %__MODULE__{}
    |> cast(attrs, [:offer_id])
  end

  def new(attrs \\ %{}) do
    attrs
    |> changeset()
    |> apply_action(:new)
  end
end
