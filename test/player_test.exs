defmodule TicTacToe.PlayerTest do
  alias TicTacToe.Player
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "Player struct creates a new Player" do
    assert %Player{} == %Player{
             marker: nil,
             name: nil,
             type: nil,
             logic: nil
           }
  end

  describe "Player.select_cell/0" do
    test "takes player input and returns it as a string when player type is :human" do
      assert capture_io("1", fn ->
               IO.write(Player.select_cell())
             end) == "1"
    end
  end

  describe "Player.select_cell/3" do
    test "returns index of best available cell when passed an AI Player" do
      player = TestHelpers.ai_player()
      cells = TestHelpers.mock_board([1, 2], "X", 9)
      assert Player.select_cell(player, cells, ["X", "O"]) == 2
    end
  end
end
