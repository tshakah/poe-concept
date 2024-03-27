defmodule PolicyOperationsEngine.StateMachine do
  use Fsmx.Struct, fsm: PolicyOperationsEngine.FlowLogic
  use Ecto.Schema
  import Ecto.Changeset

  schema "policy_engine_state_machine" do
    field(:state, :string, default: "offer")
    embeds_one(:offer, PolicyOperationsEngine.Offer)
    embeds_one(:policy, PolicyOperationsEngine.Policy)
  end

  def transition_changeset(%{} = empty_offer, "offer", data, []) do
    dbg(empty_offer)
    dbg(data)

    # changeset already includes a :state field change
    empty_offer
    |> cast_embed(:offer, required: true)
  end

  def transition_changeset(changeset, "offer", "policy", params) do
    dbg(changeset)
    dbg(params)

    # changeset already includes a :state field change
    changeset
    |> cast_embed(:offer)
    |> cast_embed(:policy, required: true)
  end
end
