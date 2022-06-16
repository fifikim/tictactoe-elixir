defmodule TicTacToe.CLI.Main do
  alias TicTacToe.Board
  alias TicTacToe.ConsoleIO
  alias TicTacToe.Game
  alias TicTacToe.Player

  @default_game %Game{
    board: %Board{cells: Enum.to_list(1..9)},
    current_player: %Player{
      marker: "X",
      name: "Player 1",
      type: :human
    },
    next_player: %Player{
      marker: "O",
      name: "Player 2",
      type: :human
    }
  }

  def start do
    ConsoleIO.greeting()

    Game.play(@default_game)

    ConsoleIO.goodbye()
  end
end
