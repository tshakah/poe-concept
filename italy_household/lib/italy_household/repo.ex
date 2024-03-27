defmodule ItalyHousehold.Repo do
  use Ecto.Repo,
    otp_app: :italy_household,
    adapter: Ecto.Adapters.SQLite3
end
