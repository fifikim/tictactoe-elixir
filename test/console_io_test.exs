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
    game = TestHelpers.new_game_p2p()

    assert capture_io(fn ->
             ConsoleIO.instructions(game)
           end) ==
             "Instructions\nEnter the number (1-9) of the space on the board where you want to move.\nPlayer 1 moves first and marks their spaces with an \"X\". Player 2 marks with an \"O\".\nTo win, claim 3 adjacent spaces in a horizontal, vertical, or diagonal line.\nIf there are no free spaces and no player has won, the game will end in a draw.\n\n"
  end

  describe "ConsoleIO.player_menu/1" do
    test "prompts the user to choose an opponent" do
      options = TestHelpers.game_options()

      assert capture_io(fn ->
               ConsoleIO.player_menu(options)
             end) =~
               "Who would you like to play against?\n"
    end

    test "prints the list of player type options" do
      options = TestHelpers.game_options()

      assert capture_io(fn ->
               ConsoleIO.player_menu(options)
             end) =~
               "1 - Another player\n2 - Lazy Computer\n3 - Smart Computer"
    end
  end

  test "ConsoleIO.turn_message/1 prints a message prompting the player to take a turn if player_type is :human" do
    assert capture_io(fn ->
             player = TestHelpers.human_player1()
             ConsoleIO.turn_message(player)
           end) == "Player 1's move:\n"
  end

  test "ConsoleIO.turn_message/1 prints a message indicating the computer is processing its move if player_type is :ai" do
    assert capture_io(fn ->
             player = TestHelpers.ai_player()
             ConsoleIO.turn_message(player)
           end) == "Player 1 (Lazy Computer) is processing its move:\n\n"
  end

  test "ConsoleIO.turn_message/1 prints a message indicating the computer is processing its move if player_type is :unbeatable_ai" do
    assert capture_io(fn ->
             player = TestHelpers.unbeatable_player()
             ConsoleIO.turn_message(player)
           end) == "Player 1 (Smart Computer) is processing its move:\n\n"
  end

  test "ConsoleIO.selection_error/1 prints the 'Invalid selection: invalid character' message to the terminal" do
    assert capture_io(fn ->
             reason = "You must select a number between 1 and 9."
             ConsoleIO.selection_error(reason)
           end) ==
             "Invalid selection! You must select a number between 1 and 9. Please try again:\n"
  end

  test "ConsoleIO.selection_error/1 prints the 'Invalid selection: cell is occupied' message to the terminal" do
    assert capture_io(fn ->
             reason = "That cell has already been taken."
             ConsoleIO.selection_error(reason)
           end) ==
             "Invalid selection! That cell has already been taken. Please try again:\n"
  end

  test "ConsoleIO.game_over/3 prints the board and \"game won\" message to the terminal" do
    assert capture_io(fn ->
             board = TestHelpers.mock_board([1, 2, 3], "X", 9)
             ConsoleIO.game_over(:won, board, "Player 1")
           end) ==
             " X | X | X \n---|---|---\n 4 | 5 | 6 \n---|---|---\n 7 | 8 | 9 \n\nGame over! Player 1 wins!\n"
  end

  test "ConsoleIO.game_over/2 prints the board and \"it's a draw\" message to the terminal" do
    assert capture_io(fn ->
             board = TestHelpers.full_board()
             ConsoleIO.game_over(:draw, board.cells)
           end) ==
             " X | X | X \n---|---|---\n X | X | O \n---|---|---\n O | O | O \n\nGame over! It's a draw!\n"
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
             ConsoleIO.display_board(board.cells)
           end) == " 1 | 2 | 3 \n---|---|---\n 4 | 5 | 6 \n---|---|---\n 7 | 8 | 9 \n\n"
  end
end
