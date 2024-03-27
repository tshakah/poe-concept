defmodule PolicyOperationsEngine do
  import Ecto.Query

  def create_offer(attrs) do
    config = build_config()
    offer_changeset = config.adapter.create_offer(attrs)

    Ecto.Multi.new()
    |> Ecto.Multi.insert(:offer, offer_changeset)
    |> Ecto.Multi.insert(:state, fn %{offer: offer} ->
      %PolicyOperationsEngine.StateMachine{offer: %{offer_id: offer.id}}
    end)
    |> config.repo.transaction()
  end

  def issue_policy(offer, attrs) do
    config = build_config()

    offer_state =
      PolicyOperationsEngine.StateMachine
      |> where([s], s.offer["offer_id"] == ^offer.id)
      |> config.repo.one!()

    policy_changeset = config.adapter.issue_policy(%{offer_state | id: nil}, attrs)

    Ecto.Multi.new()
    |> Ecto.Multi.insert(:policy, policy_changeset)
    |> dbg()
    |> config.repo.transaction()
  end

  def change_policy(policy, changes) do
    config = build_config()
    config.adapter.change_policy(policy, changes)
  end

  def get_policy(id) do
    config = build_config()
    config.adapter.get_policy(id)
  end

  defp build_config(overrides \\ %{}) do
    :policy_operations_engine
    |> Application.fetch_env!(:engine)
    |> Map.new()
    |> Map.merge(overrides)
    |> handle_adapter_config()
  end

  defp handle_adapter_config(base_config = %{adapter: adapter}) do
    adapter.handle_config(base_config)
  end
end
