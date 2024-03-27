defmodule PolicyOperationsEngineTest do
  use ExUnit.Case
  doctest PolicyOperationsEngine

  test "greets the world" do
    assert PolicyOperationsEngine.hello() == :world
  end
end
