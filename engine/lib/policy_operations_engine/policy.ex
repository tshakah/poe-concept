defmodule PolicyOperationsEngine.Policy do
  use Ecto.Schema
  import Ecto.Changeset

  @derive Jason.Encoder
  embedded_schema do
    belongs_to(:policy, Application.compile_env!(:policy_operations_engine, :policy_module))
  end

  def changeset(attrs \\ %{}) do
    %__MODULE__{}
    |> cast(attrs, [:policy_id])
  end

  def new(attrs \\ %{}) do
    attrs
    |> changeset()
    |> apply_action(:new)
  end
end
