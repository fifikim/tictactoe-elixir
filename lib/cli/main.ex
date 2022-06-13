defmodule TicTacToe.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  def start_game do
    Shell.info("Welcome to Tic Tac Toe!")
  end
end
