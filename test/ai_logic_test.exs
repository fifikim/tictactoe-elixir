defmodule TicTacToe.AiLogicTest do
  alias TicTacToe.AiLogic
  use ExUnit.Case

  @test_boards [
    {"AI selects index 0 when there are no occupied cells", 0,
     TestHelpers.mock_board([], "X", 9)},
    {"AI selects index of winning move when it's in a winning position and human player is not",
     2, TestHelpers.mock_board([{[1, 2], "X"}, {[4, 9], "O"}], 9)},
    {"AI selects index of a blocking move when human player is in a winning position and AI is not",
     0, TestHelpers.mock_board([{[3, 7], "X"}, {[5, 9], "O"}], 9)},
    {"AI selects index of a winning move instead of a blocking move when both players are in winning positions",
     6, TestHelpers.mock_board([{[1, 4], "X"}, {[3, 6], "O"}], 9)}
  ]

  describe "AiLogic.find_best_cell/2" do
    for {description, selection, cells} <- @test_boards do
      test "#{description}" do
        assert AiLogic.find_best_cell(unquote(cells), ["X", "O"]) == unquote(selection)
      end
    end
  end
end
