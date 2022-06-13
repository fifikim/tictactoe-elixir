defmodule Mix.Tasks.Start do
  alias TicTacToe.CLI.Main
  use Mix.Task

  def run(_), do: Main.start()
end
