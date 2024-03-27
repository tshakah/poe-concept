defmodule ItalyHousehold do
  @moduledoc """
  A stub implementation for the Italian household product
  """

  @behaviour PolicyOperationsEngine.Adapter

  alias ItalyHousehold

  def create_offer(attrs) do
    ItalyHousehold.Offer.changeset(attrs)
  end

  def issue_policy(offer, attrs) do
    ItalyHousehold.Policy.changeset(attrs)
  end

  def change_policy(policy, changes) do
    # policy =
    #  policy.id
    #  |> State.get()
    #  |> Map.merge(changes)
    #  |> State.push()

    # {:ok, policy}
  end

  def get_policy(id), do: State.get(id)

  def handle_config(config), do: config
end
