defmodule PolicyOperationsEngine.FlowLogic do
  import Ecto.Changeset

  def transition_changeset(changeset, from, to, params) do
    dbg(changeset)
    dbg(from)
    dbg(to)
    dbg(params)

    changeset
  end

  use Fsmx.Struct,
    transitions: %{
      "offer" => ["policy"],
      "policy" => ["active-mta"],
      "active-mta" => "policy",
      # can transition from any state to "terminated"
      :* => ["terminated"]
    }
end
