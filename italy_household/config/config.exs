import Config

config :italy_household,
  ecto_repos: [ItalyHousehold.Repo]

config :italy_household, ItalyHousehold.Repo, database: "db/poe.db"

config :policy_operations_engine, :engine,
  repo: ItalyHousehold.Repo,
  adapter: ItalyHousehold

config :policy_operations_engine,
  offer_module: ItalyHousehold.Offer,
  policy_module: ItalyHousehold.Policy
