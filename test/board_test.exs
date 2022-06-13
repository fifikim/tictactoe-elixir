defmodule TicTacToe.BoardTest do
  alias TicTacToe.Board

  use ExUnit.Case

  test "Board struct creates a struct that contains a key of :cells and value of list [1, 2 3 4 5 6 7 8 9]" do
    board = %Board{}
    assert board.cells == [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

end