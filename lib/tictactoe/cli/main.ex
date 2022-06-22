defmodule TicTacToe.CLI.Main do
  alias TicTacToe.CLI.PlayerMenu
  alias TicTacToe.ConsoleIO
  alias TicTacToe.Game

  def start do
    ConsoleIO.greeting()

    Game.play(PlayerMenu.select_opponent())

    ConsoleIO.goodbye()
  end
end
