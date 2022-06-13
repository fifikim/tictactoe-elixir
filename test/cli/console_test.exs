defmodule TicTacToe.CLI.ConsoleTest do
  alias TicTacToe.Board
  alias TicTacToe.CLI.Console

  use ExUnit.Case

  import ExUnit.CaptureIO

  test "Console.display_greeting/0 prints the greeting & instructions to the terminal" do
    assert capture_io(fn ->
             Console.display_instructions()
           end) ==
             "Welcome to Tic Tac Toe!\n\nInstructions:\nEnter the number (1-9) of the space on the board where you want to move.\nPlayer 1 moves first and marks their spaces with an \"X\". Player 2 marks with an \"O\".\nTo win, claim 3 adjacent spaces in a horizontal, vertical, or diagonal line.\nIf there are no free spaces and no player has won, the game will end in a draw.\n\nStarting new game...\n\n"
  end

  test "Console.display_board/1 prints the Board to the terminal" do
    board = %Board{}

    assert capture_io(fn ->
             Console.display_board(board)
           end) == " 1 | 2 | 3 \n---|---|---\n 4 | 5 | 6 \n---|---|---\n 7 | 8 | 9 \n"
  end
end
