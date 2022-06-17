defmodule TicTacToe.Game do
  alias TicTacToe.Board
  alias TicTacToe.ConsoleIO
  alias TicTacToe.Game
  alias TicTacToe.Player
  alias TicTacToe.Validation
  alias TicTacToe.WinFinder

  defstruct board: nil,
            current_player: nil,
            next_player: nil,
            game_status: :active

  def play(%Game{} = game) do
    ConsoleIO.new_game()
    ConsoleIO.instructions(game)
    take_turn(game)
  end

  defp take_turn(%Game{
         board: %Board{cells: cells},
         next_player: %Player{name: name},
         game_status: :won
       }),
       do: ConsoleIO.game_won(cells, name)

  defp take_turn(%Game{
         board: %Board{cells: cells},
         game_status: :drawn
       }),
       do: ConsoleIO.game_drawn(cells)

  defp take_turn(
         %Game{
           board: %Board{cells: cells} = board,
           current_player: %Player{marker: current_player_marker} = current_player
         } = game
       ) do
    ConsoleIO.display_board(cells)
    ConsoleIO.turn_message(current_player)

    start_turn(game)
    |> Board.update(current_player_marker, board)
    |> end_turn(game)
    |> take_turn()
  end

  defp start_turn(%Game{} = game) do
    Player.select_cell()
    |> Validation.check_selection(game)
    |> record_or_reprompt(game)
  end

  defp record_or_reprompt({:ok, index}, _game), do: index

  defp record_or_reprompt({:error, reason}, %Game{} = game) do
    ConsoleIO.selection_error(reason)
    start_turn(game)
  end

  defp end_turn(
         %Board{} = updated_board,
         %Game{
           current_player: %Player{marker: current_player_marker} = current_player,
           next_player: %Player{marker: next_player_marker} = next_player
         } = game
       ) do
    %Game{
      game
      | board: updated_board,
        current_player: next_player,
        next_player: current_player,
        game_status:
          check_over(updated_board, current_player, [current_player_marker, next_player_marker])
    }
  end

  defp check_over(
         %Board{cells: cells} = board,
         %Player{marker: current_player_marker},
         markers
       ) do
    cond do
      WinFinder.game_won?(cells, current_player_marker) -> :won
      Board.full?(board, markers) -> :drawn
      true -> :active
    end
  end
end
