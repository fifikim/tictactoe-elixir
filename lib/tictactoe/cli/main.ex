defmodule TicTacToe.CLI.Main do
  alias TicTacToe.Game
  alias TicTacToe.Players

  import TicTacToe.CLI.Console
  import TicTacToe.CLI.Play

  def start do
    instructions()

    players = %Players{}
    game = %Game{current_player: players.player1}
    play(game, players)

    goodbye()
  end
end
