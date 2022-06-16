defmodule TicTacToe.PlayerTest do
  alias TicTacToe.Player
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "Player struct creates a new Player" do
    assert %Player{} == %Player{
             marker: nil,
             name: nil,
             type: nil
           }
  end

  test "Player.select_cell/0 takes player input and returns it as a string" do
    assert capture_io("1", fn ->
             IO.write(Player.select_cell())
           end) == "1"
  end
end
