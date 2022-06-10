defmodule TicTacToe.CLITest do
  use ExUnit.Case

  test "main returns the Welcome greeting" do
    assert TicTacToe.CLI.main(1) == "Welcome to Tic Tac Toe!"
  end
end
