defmodule TicTacToe.GameTest do
  alias TicTacToe.Game
  use ExUnit.Case
  import ExUnit.CaptureIO

  @default_moves "1\n2\n3\n4\n5\n6\n7\n8\n9"

  test "Game struct creates a new Game" do
    assert %Game{} == %Game{
             board: nil,
             current_player: nil,
             next_player: nil
           }
  end

  describe "Game.play/1" do
    test "prints the 'new game' message" do
      assert capture_io([input: @default_moves], fn ->
               game = TestHelpers.new_game()
               Game.play(game)
             end) =~ "Starting new game..."
    end

    test "prints the instructions" do
      assert capture_io([input: @default_moves], fn ->
               game = TestHelpers.new_game()
               Game.play(game)
             end) =~ "Instructions"
    end

    test "prints the board" do
      assert capture_io([input: @default_moves], fn ->
               game = TestHelpers.new_game()
               Game.play(game)
             end) =~ " X | O | X "
    end

    test "starts the game & ends when there is a draw" do
      assert capture_io([input: "5\n2\n8\n7\n4\n6\n3\n1\n9"], fn ->
               game = TestHelpers.new_game()
               Game.play(game)
             end) =~ "Game over! It's a draw!"
    end

    test "starts the game & ends when there is a winner" do
      assert capture_io([input: @default_moves], fn ->
               game = TestHelpers.new_game()
               Game.play(game)
             end) =~ "Game over! Player 1 wins!"
    end
  end
end
