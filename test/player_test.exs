defmodule TicTacToe.PlayerTest do
  alias TicTacToe.Board
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

  describe "Player.select_cell/3" do
    test "takes player input and returns it as a string when player type is :human" do
      assert capture_io("1", fn ->
               board = TestHelpers.new_board()
               IO.write(Player.select_cell(:human, board, ["X", "O"]))
             end) == "1"
    end

    test "selects the first available cell when player type is :ai" do
      assert capture_io(fn ->
               cells = TestHelpers.mock_board([1, 2, 3], "X", 9)
               IO.write(Player.select_cell(:ai, %Board{cells: cells}, ["X", "O"]))
             end) == "4"
    end
  end
end
