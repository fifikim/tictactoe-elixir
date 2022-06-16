defmodule TicTacToe.BoardTest do
  alias TicTacToe.Board
  use ExUnit.Case

  test "Board struct creates a new Board", do: assert(%Board{} == %Board{cells: nil})

  test "Board.update/3 updates a board with a given marker at a given index" do
    board = TestHelpers.new_board()
    assert Board.update(0, "X", board) == %Board{cells: ["X", 2, 3, 4, 5, 6, 7, 8, 9]}
  end

  test "Board.space_occupied?/3 returns true if a space is occupied" do
    full_board = TestHelpers.full_board()
    assert Board.space_occupied?(0, full_board, ["X", "O"]) == true
  end

  test "Board.space_occupied?/3 returns false if a space is not occupied" do
    empty_board = TestHelpers.new_board()
    assert Board.space_occupied?(0, empty_board, ["X", "O"]) == false
  end

  test "Board.full?/2 returns true if the board is full" do
    full_board = TestHelpers.full_board()
    assert Board.full?(full_board, ["X", "O"]) == true
  end

  test "Board.full?/2 returns false if the board is full" do
    empty_board = TestHelpers.new_board()
    assert Board.full?(empty_board, ["X", "O"]) == false
  end
end
