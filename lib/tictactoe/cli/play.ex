defmodule TicTacToe.CLI.Play do
  alias TicTacToe.Game

  import TicTacToe.CLI.Console

  def play(game, _players) when game.game_over, do: game_won()
  def play(game, players), do: take_turn(game, players)

  def take_turn(
        %Game{board: board, current_player: current_player, game_over: _game_over},
        players
      ) do
    display_board(board)
    display_turn(current_player)

    # selection = select_space()
    # validation
    # record selection to board

    select_space(board, current_player)
    |> update_board(board)
    |> update_game(current_player, players)
    |> play(players)
  end

  def select_space(_board, current_player) do
    # cell
    # |> validate_selection(board, current_player)
    {1, current_player.marker}
  end

  # def validate_selection(cell, board, current_player) do
  #   if cell_valid and cell_free do
  #     {cell, current_player.marker}
  #   else
  #     invalid_selection()
  #     select_space(board, current_player)
  #   end
  # end

  def update_board({cell, marker}, board) do
    new_cells = List.replace_at(board.cells, cell - 1, marker)
    %{board | cells: new_cells}
  end

  def update_game(board, current_player, players) do
    next_player = switch_player(current_player, players)
    over? = check_won(board)
    %Game{board: board, current_player: next_player, game_over: over?}
  end

  def switch_player(current_player, players) do
    if current_player == players.player1 do
      players.player2
    else
      players.player1
    end
  end

  def check_won(_board) do
    true
  end
end
