defmodule TicTacToe.CLI.MainTest do
  alias TicTacToe.CLI.Main, as: Main
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "main prints the Welcome greeting to the terminal" do
    assert capture_io(fn ->
             Main.start_game()
           end) == "Welcome to Tic Tac Toe!\n"
  end
end
