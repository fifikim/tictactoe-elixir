defmodule TicTacToe.Game do
  alias TicTacToe.Board
  alias TicTacToe.ConsoleIO
  alias TicTacToe.Game
  alias TicTacToe.Player
  alias TicTacToe.Validation

  defstruct board: nil,
            players: nil,
            current_player: nil,
            markers: nil,
            size: nil,
            game_over: false

  def play(%Game{} = game) do
    ConsoleIO.new_game()
    ConsoleIO.instructions(game)
    take_turn(game)
  end

  defp take_turn(%Game{
         current_player: current_player,
         game_over: true
       }),
       do: ConsoleIO.game_won(current_player)

  defp take_turn(
         %Game{
           board: board,
           current_player: current_player
         } = game
       ) do
    ConsoleIO.display_board(board)
    ConsoleIO.output(current_player.turn_msg)

    start_turn(game)
    |> Board.update(current_player.marker, board)
    |> end_turn(game)
    |> take_turn()
  end

  defp start_turn(%Game{} = game) do
    Player.select_cell()
    |> Validation.check_selection(game)
    |> record_or_reprompt()
  end

  defp record_or_reprompt({:ok, index}), do: index

  defp record_or_reprompt({error_code, %Game{size: size} = game}) do
    ConsoleIO.selection_error(error_code, size)
    start_turn(game)
  end

  defp end_turn(%Board{} = new_board, %Game{markers: markers} = game) do
    %Game{
      game
      | board: new_board,
        current_player: switch_player(game),
        game_over: check_over(new_board, markers)
    }
  end

  defp switch_player(%Game{
         current_player: current_player,
         players: %{player1: player1, player2: player2}
       })
       when current_player == player1,
       do: player2

  defp switch_player(%Game{players: %{player1: player1, player2: _player2}}), do: player1

  defp check_over(%Board{} = board, markers) do
    Board.full?(board, markers)
  end
end
