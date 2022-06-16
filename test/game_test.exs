defmodule TicTacToe.GameTest do
  alias TicTacToe.Game
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "Game struct creates a new Game" do
    assert %Game{} == %Game{
             board: nil,
             current_player: nil,
             next_player: nil,
             game_status: :active
           }
  end

  test "Game.play/1 prints the 'new game' message" do
    assert capture_io([input: "1\n1\n2\n3\n4\n5\n6\n7\n8\n9"], fn ->
             game = TestHelpers.new_game()
             Game.play(game)
           end) =~ "Starting new game..."
  end

  test "Game.play/1 prints the instructions" do
    assert capture_io([input: "1\n1\n2\n3\n4\n5\n6\n7\n8\n9"], fn ->
             game = TestHelpers.new_game()
             Game.play(game)
           end) =~ "Instructions"
  end

  test "Game.play/1 prints the board" do
    assert capture_io([input: "1\n1\n2\n3\n4\n5\n6\n7\n8\n9"], fn ->
             game = TestHelpers.new_game()
             Game.play(game)
           end) =~ " X | O | X "
  end

  test "Game.play/1 starts the game & continues until game is over" do
    assert capture_io([input: "1\n1\n2\n3\n4\n5\n6\n7\n8\n9"], fn ->
             game = TestHelpers.new_game()
             Game.play(game)
           end) =~ "Game over!"
  end
end
