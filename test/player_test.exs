defmodule TicTacToe.PlayerTest do
  alias TicTacToe.AiLogic
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

  describe "Player.select_cell/0" do
    test "takes player input and returns it as a string when player type is :human" do
      assert capture_io("1", fn ->
               IO.write(Player.select_cell())
             end) == "1"
    end
  end

  describe "Player.select_cell/1" do
    test "returns Player's logic module when passed a Player" do
      player = TestHelpers.ai_player()
      assert Player.select_cell(player) == AiLogic
    end
  end
end
