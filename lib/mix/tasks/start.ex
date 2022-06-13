defmodule Mix.Tasks.Start do
  alias TicTacToe.CLI.Main, as: Main
  use Mix.Task

  def run(_), do: Main.start_game()
end
