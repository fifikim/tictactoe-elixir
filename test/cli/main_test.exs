defmodule TicTacToe.CLI.MainTest do
  alias TicTacToe.CLI.Main
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "Main.start/0 prints the 'welcome' greeting" do
    assert capture_io([input: "1\n1\n2\n3\n4\n5\n6\n7\n8\n9"], fn ->
             Main.start()
           end) =~ "Welcome to Tic Tac Toe!"
  end

  test "Main.start/0 starts a new game" do
    assert capture_io([input: "1\n1\n2\n3\n4\n5\n6\n7\n8\n9"], fn ->
             Main.start()
           end) =~ "Starting new game..."
  end

  test "Main.start/0 continues play until the game is over" do
    assert capture_io([input: "1\n1\n2\n3\n4\n5\n6\n7\n8\n9"], fn ->
             Main.start()
           end) =~ "Game over!"
  end

  test "Main.start/0 prints the 'goodbye' message after the game is over" do
    assert capture_io([input: "1\n1\n2\n3\n4\n5\n6\n7\n8\n9"], fn ->
             Main.start()
           end) =~ "Thanks for playing! Goodbye."
  end
end
