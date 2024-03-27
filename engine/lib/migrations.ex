defmodule PolicyOperationsEngine.Migrations do
  use Ecto.Migration

  def change do
    create table(:policy_engine_state_machine) do
      add(:state, :text, null: false)
      add(:offer, :map, null: false)
      add(:policy, :map)
    end
  end
end
