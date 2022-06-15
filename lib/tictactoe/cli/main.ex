defmodule TicTacToe.CLI.Main do
  alias TicTacToe.Board
  alias TicTacToe.ConsoleIO
  alias TicTacToe.Game
  alias TicTacToe.Player

  @default_game %Game{
    board: %Board{cells: Enum.to_list(1..9)},
    players: %{
      player1: %Player{
        marker: "X",
        name: "Player 1",
        turn_msg: "Player 1's turn:",
        type: :human
      },
      player2: %Player{
        marker: "O",
        name: "Player 2",
        turn_msg: "Player 2's turn:",
        type: :human
      }
    },
    current_player: %Player{
      marker: "X",
      name: "Player 1",
      turn_msg: "Player 1's turn:",
      type: :human
    },
    markers: ["X", "O"],
    size: 9
  }

  def start do
    ConsoleIO.greeting()

    Game.play(@default_game)

    ConsoleIO.goodbye()
  end
end
