defmodule ItalyHousehold.Repo.Migrations.AddOffersAndPolicices do
  use Ecto.Migration

  def change do
    create table(:offers) do
      add :name, :text, null: false
    end

    create table(:policies) do
      add :name, :text, null: false
    end
  end
end
