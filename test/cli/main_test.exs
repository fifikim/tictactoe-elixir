defmodule TicTacToe.CLI.MainTest do
  alias TicTacToe.CLI.Main
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "Main.start_game/0 prints the instructions to the terminal" do
    assert capture_io(fn ->
             Main.start()
           end) =~ "Welcome to Tic Tac Toe!\n\nInstructions:"
  end

  test "Main.start_game/0 prints the board to the terminal" do
    assert capture_io(fn ->
             Main.start()
           end) =~ " 1 | 2 | 3 "
  end
end
