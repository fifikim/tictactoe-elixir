defmodule TicTacToe.CLI.GameConfig do
  alias TicTacToe.Board
  alias TicTacToe.ConsoleIO
  alias TicTacToe.Game
  alias TicTacToe.Player
  alias TicTacToe.Validation

  @p2p_game %Game{
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

  @ai_game %Game{
    board: %Board{cells: Enum.to_list(1..9)},
    current_player: %Player{
      marker: "X",
      name: "Player 1 (Computer)",
      type: :ai
    },
    next_player: %Player{
      marker: "O",
      name: "Player 2",
      type: :human
    }
  }

  @player_types [
    {"Another player", @p2p_game},
    {"Computer", @ai_game}
  ]

  def select_opponent do
    ConsoleIO.player_menu(@player_types)
    get_selection()
  end

  defp get_selection do
    ConsoleIO.input()
    |> Validation.menu_selection(@player_types)
    |> handle_player_selection()
  end

  defp handle_player_selection({:ok, index}) do
    @player_types
    |> Enum.at(index)
    |> elem(1)
  end

  defp handle_player_selection({:error, reason}) do
    ConsoleIO.selection_error(reason)
    get_selection()
  end
end
