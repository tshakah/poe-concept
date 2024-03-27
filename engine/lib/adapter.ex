defmodule PolicyOperationsEngine.Adapter do
  @moduledoc """
  Behaviour for creating PolicyOperationsEngine adapters.
  """

  @callback create_offer(map()) :: {:ok, map()} | {:error, any()}
  @callback issue_policy(map(), map()) :: {:ok, map()} | {:error, any()}
  @callback change_policy(map(), map()) :: {:ok, map()} | {:error, any()}
  @callback get_policy(String.t()) :: {:ok, map()} | {:error, any()}
  @callback handle_config(map()) :: map()
end
