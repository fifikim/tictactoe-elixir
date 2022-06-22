# defmodule TicTacToe.AiLogicTest do
#   alias TicTacToe.AiLogic
#   alias TicTacToe.Board
#   use ExUnit.Case

#   @test_boards [
#     {"no occupied cells", "1", TestHelpers.mock_board([], "X", 9)},
#     {"the first cell occupied", "2", TestHelpers.mock_board([1], "X", 9)},
#     {"the first two cells occupied", "3", TestHelpers.mock_board([1, 2], "X", 9)},
#     {"the first and third space occupied", "2", TestHelpers.mock_board([1, 3], "X", 9)}
#   ]

#   describe "AiLogic.find_best/2" do
#     for {description, selection, cells} <- @test_boards do
#       test "selects the best cell from a board with #{description}" do
#         assert AiLogic.find_best(unquote(cells), ["X", "O"]) == unquote(selection)
#       end
#     end
#   end
# end
