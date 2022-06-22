defmodule TicTacToe.CLI.Main do
  alias TicTacToe.CLI.GameConfig
  alias TicTacToe.ConsoleIO
  alias TicTacToe.Game

  def start do
    ConsoleIO.greeting()

    Game.play(GameConfig.select_opponent())

    ConsoleIO.goodbye()
  end
end
