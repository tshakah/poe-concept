defmodule PolicyOperationsEngine do
  import Ecto.Query

  def create_offer(attrs) do
    config = build_config()
    offer_changeset = config.adapter.create_offer(attrs)

    offer_changeset
    |> config.repo.insert()
  end

  def issue_policy(offer, attrs) do
    config = build_config()

    policy_changeset = config.adapter.issue_policy(offer, attrs)

    policy_changeset
    |> config.repo.insert()
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
