defmodule TicTacToe.PlayerTest do
  alias TicTacToe.Player
  use ExUnit.Case

  test "Player struct creates a new Player" do
    assert %Player{} == %Player{
             marker: nil,
             name: nil,
             type: nil,
             logic: nil
           }
  end
end
