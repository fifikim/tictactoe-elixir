defmodule TicTacToe.CLI.MainTest do
  alias TicTacToe.CLI.Main
  use ExUnit.Case
  import ExUnit.CaptureIO

  @default_moves "1\n1\n2\n3\n4\n5\n6\n7\n8\n9"

  describe "Main.start/0" do
    test "prints the 'welcome' greeting" do
      assert capture_io([input: @default_moves], fn ->
               Main.start()
             end) =~ "Welcome to Tic Tac Toe!"
    end

    test "displays the player menu" do
      assert capture_io([input: @default_moves], fn ->
               Main.start()
             end) =~ "Who would you like to play against?"
    end

    test "starts a new game" do
      assert capture_io([input: @default_moves], fn ->
               Main.start()
             end) =~ "Starting new game..."
    end

    test "continues play until the game is over" do
      assert capture_io([input: @default_moves], fn ->
               Main.start()
             end) =~ "Game over!"
    end

    test "prints the 'goodbye' message after the game is over" do
      assert capture_io([input: @default_moves], fn ->
               Main.start()
             end) =~ "Thanks for playing! Goodbye."
    end
  end
end
