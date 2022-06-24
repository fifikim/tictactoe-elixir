defmodule TicTacToe.Game do
  alias TicTacToe.Board
  alias TicTacToe.ConsoleIO
  alias TicTacToe.Game
  alias TicTacToe.Player
  alias TicTacToe.Validation
  alias TicTacToe.WinFinder

  defstruct board: nil,
            current_player: nil,
            next_player: nil

  def play(%Game{} = game) do
    ConsoleIO.new_game()
    ConsoleIO.instructions(game)
    take_turn(game)
  end

  defp take_turn(
         %Game{
           board: %Board{cells: cells},
           current_player: %Player{marker: current_player_marker} = current_player
         } = game
       ) do
    ConsoleIO.display_board(cells)
    ConsoleIO.turn_message(current_player)

    move(game)
    |> Board.update(current_player_marker, cells)
    |> check_over(game)
  end

  defp move(%Game{
         board: %Board{cells: cells},
         current_player: %Player{marker: ai_marker, type: :ai} = ai_player,
         next_player: %Player{marker: next_player_marker}
       }) do
    ai_player
    |> Player.select_cell()
    |> then(fn logic -> logic.find_best_cell(cells, [ai_marker, next_player_marker]) end)
  end

  defp move(%Game{} = game) do
    Player.select_cell()
    |> Validation.cell_selection(game)
    |> handle_cell_selection(game)
  end

  defp handle_cell_selection({:ok, index}, _game), do: index

  defp handle_cell_selection({:error, reason}, %Game{} = game) do
    ConsoleIO.selection_error(reason)
    move(game)
  end

  defp check_over(
         %Board{cells: cells} = updated_board,
         %Game{
           current_player:
             %Player{marker: current_player_marker, name: current_player_name} = current_player,
           next_player: %Player{marker: next_player_marker} = next_player
         } = game
       ) do
    cond do
      WinFinder.game_won?(cells, current_player_marker) ->
        ConsoleIO.game_over(:won, cells, current_player_name)

      Board.full?(cells, [current_player_marker, next_player_marker]) ->
        ConsoleIO.game_over(:draw, cells)

      true ->
        take_turn(%Game{
          game
          | board: updated_board,
            current_player: next_player,
            next_player: current_player
        })
    end
  end
end
