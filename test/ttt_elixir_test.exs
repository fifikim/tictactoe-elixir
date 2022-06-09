defmodule TttElixirTest do
  use ExUnit.Case
  doctest TttElixir

  test "greets the world" do
    assert TttElixir.hello() == :world
  end
end
