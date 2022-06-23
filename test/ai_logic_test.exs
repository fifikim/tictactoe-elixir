defmodule TicTacToe.AiLogicTest do
  alias TicTacToe.AiLogic
  use ExUnit.Case

  @test_boards [
    {"there are no occupied cells", "1", TestHelpers.mock_board([], "X", 9)},
    {"the first two cells are occupied by X", "3", TestHelpers.mock_board([1, 2], "X", 9)},
    {"the first and third cell are occupied by X", "2", TestHelpers.mock_board([1, 3], "X", 9)},
    {"the fifth and sixth cell are occupied by X and eighth and nine cell are occupied by O", "3",
     TestHelpers.mock_board([{[1, 2], "X"}, {[4, 5], "O"}], 9)},
    {"X loses if it picks cell 6 or wins at cell 7", "7",
     TestHelpers.mock_board([{[1, 2, 4, 8], "X"}, {[3, 5, 9], "O"}], 9)},
    {"X draws if it picks cell 6 or wins at cell 7", "7",
     TestHelpers.mock_board([{[1, 2, 4, 9], "X"}, {[3, 5, 8], "O"}], 9)},
    {"X draws if it picks cell 6", "6",
     TestHelpers.mock_board([{[1, 2, 7, 9], "X"}, {[3, 4, 5, 8], "O"}], 9)}
  ]

  describe "AiLogic.find_best_cell/2" do
    for {description, selection, cells} <- @test_boards do
      test "selects the best cell when #{description}" do
        assert AiLogic.find_best_cell(unquote(cells), ["X", "O"]) == unquote(selection)
      end
    end
  end
end
