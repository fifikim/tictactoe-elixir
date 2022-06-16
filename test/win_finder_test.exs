# defmodule TicTacToe.WinFinderTest do
#   alias TicTacToe.WinFinder
#   use ExUnit.Case

#   test "WinFinder.game_won?/2 returns true when the board contains a winning combination" do
#     board = TestHelpers.winning_board()
#     marker = "X"
#     assert WinFinder.game_won?(board, marker) == true
#   end

#   test "WinFinder.game_won?/2 returns false when the board does not contain a winning combination" do
#     board = TestHelpers.new_board()
#     marker = "X"
#     assert WinFinder.game_won?(board, marker) == false
#   end
# end
