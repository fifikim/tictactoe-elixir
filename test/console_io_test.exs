defmodule TicTacToe.ConsoleIOTest do
  alias TicTacToe.ConsoleIO
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "ConsoleIO.input/0 takes input and returns a string with whitespace trimmed" do
    assert capture_io(" 3   \n", fn ->
             IO.write(ConsoleIO.input())
           end) == "3"
  end

  test "ConsoleIO.display_greeting/0 prints the greeting to the terminal" do
    assert capture_io(fn ->
             ConsoleIO.greeting()
           end) ==
             "Welcome to Tic Tac Toe!\n\n"
  end

  test "ConsoleIO.new_game/0 prints the 'new game' message to the terminal" do
    assert capture_io(fn ->
             ConsoleIO.new_game()
           end) ==
             "Starting new game...\n\n"
  end

  test "ConsoleIO.instructions/1 takes in a game & prints instructions to the terminal" do
    game = TestHelpers.new_game()

    assert capture_io(fn ->
             ConsoleIO.instructions(game)
           end) ==
             "Instructions\nEnter the number (1-9) of the space on the board where you want to move.\nPlayer 1 moves first and marks their spaces with an \"X\". Player 2 marks with an \"O\".\nTo win, claim 3 adjacent spaces in a horizontal, vertical, or diagonal line.\nIf there are no free spaces and no player has won, the game will end in a draw.\n\n"
  end

  test "ConsoleIO.selection_error/2 prints the 'invalid move (character)' message to the terminal" do
    assert capture_io(fn ->
             board_size = 9
             ConsoleIO.selection_error(:char, board_size)
           end) ==
             "Invalid selection! Please select a number between 1 and 9:\n"
  end

  test "ConsoleIO.selection_error/1 prints the 'invalid move (occupied)' message to the terminal" do
    assert capture_io(fn ->
             board_size = 9
             ConsoleIO.selection_error(:occupied, board_size)
           end) ==
             "Invalid selection! Please select a free space:\n"
  end

  test "ConsoleIO.game_won/1 takes in a winner's name & prints the 'game won' message to the terminal" do
    assert capture_io(fn ->
             winner = "Test Player"
             ConsoleIO.game_won(winner)
           end) ==
             "Game over! Test Player wins!\n"
  end

  test "ConsoleIO.goodbye/0 prints the 'goodbye' message to the terminal" do
    assert capture_io(fn ->
             ConsoleIO.goodbye()
           end) ==
             "Thanks for playing! Goodbye.\n"
  end

  test "ConsoleIO.display_board/1 prints the Board to the terminal" do
    board = TestHelpers.new_board()

    assert capture_io(fn ->
             ConsoleIO.display_board(board)
           end) == " 1 | 2 | 3 \n---|---|---\n 4 | 5 | 6 \n---|---|---\n 7 | 8 | 9 \n\n"
  end
end
