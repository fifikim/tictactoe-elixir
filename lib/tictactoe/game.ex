defmodule TicTacToe.Game do
  alias TicTacToe.Board
  alias TicTacToe.ConsoleIO
  alias TicTacToe.Game
  alias TicTacToe.Player
  alias TicTacToe.Validation

  defstruct board: nil,
            current_player: nil,
            next_player: nil,
            game_over: false

  def play(%Game{} = game) do
    ConsoleIO.new_game()
    ConsoleIO.instructions(game)
    take_turn(game)
  end

  defp take_turn(%Game{
         board: board,
         current_player: current_player,
         game_over: true
       }),
       do: ConsoleIO.game_won(%Board{} = board, current_player)

  defp take_turn(
         %Game{
           board: board,
           current_player: %Player{marker: current_player_marker} = current_player
         } = game
       ) do
    ConsoleIO.display_board(board)
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
         %Board{} = new_board,
         %Game{
           current_player: %Player{marker: current_player_marker} = current_player,
           next_player: %Player{marker: next_player_marker} = next_player
         } = game
       ) do
    %Game{
      game
      | board: new_board,
        current_player: next_player,
        next_player: current_player,
        game_over: check_over(new_board, [current_player_marker, next_player_marker])
    }
  end

  defp check_over(%Board{} = board, markers), do: Board.full?(board, markers)
end
