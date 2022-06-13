defmodule TicTacToe.CLI.MainTest do
  alias TicTacToe.CLI.Main
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "Main.start_game/0 prints the greeting to the terminal" do
    assert capture_io(fn ->
             Main.start_game()
           end) =~ "Welcome to Tic Tac Toe!"
  end

  test "Main.start_game/0 prints the instructions & board to the terminal" do
    assert capture_io(fn ->
             Main.start_game()
           end) =~ "Instructions:"
  end

  test "Main.start_game/0 prints the board to the terminal" do
    assert capture_io(fn ->
             Main.start_game()
           end) =~ " 1 | 2 | 3 "
  end
end
