defmodule TicTacToe.WinFinderTest do
  alias TicTacToe.WinFinder
  use ExUnit.Case

  @winning_combos3x3 [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [3, 5, 7]
  ]

  describe "WinFinder.game_won?/2" do
    for combo <- @winning_combos3x3 do
      test "returns true when the board contains markers at #{combo}" do
        game_won? =
          unquote(combo)
          |> TestHelpers.place_markers("X", 9)
          |> WinFinder.game_won?("X")

        assert game_won? == true
      end
    end

    test "returns false when the board does not contain a winning combination" do
      board = TestHelpers.new_board()
      assert WinFinder.game_won?(board.cells, "X") == false
    end
  end
end
