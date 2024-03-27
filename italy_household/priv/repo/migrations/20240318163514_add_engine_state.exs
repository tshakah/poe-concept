defmodule ItalyHousehold.Repo.Migrations.AddEngineState do
  use Ecto.Migration

  def change do
    PolicyOperationsEngine.Migrations.change()
  end
end
