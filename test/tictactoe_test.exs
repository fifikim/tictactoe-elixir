defmodule TicTacToe.CLITest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "main prints the Welcome greeting to the terminal" do
    assert capture_io(fn ->
             TicTacToe.CLI.main(1)
           end) == "Welcome to Tic Tac Toe!\n"
  end
end
