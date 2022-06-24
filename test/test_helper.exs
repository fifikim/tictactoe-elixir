ExUnit.start()

defmodule TestHelpers do
  alias TicTacToe.AiLogic
  alias TicTacToe.Board
  alias TicTacToe.Game
  alias TicTacToe.Player

  def invalid_inputs,
    do: [
      {"t", "not a number"},
      {"100", "an out-of-range number"},
      {"", "empty"}
    ]

  def new_board, do: %Board{cells: [1, 2, 3, 4, 5, 6, 7, 8, 9]}
  def full_board, do: %Board{cells: ["X", "X", "X", "X", "X", "O", "O", "O", "O"]}

  def game_options,
    do: [
      {"Another player", new_game_p2p()},
      {"Computer", new_game_ai()}
    ]

  def ai_player,
    do: %Player{
      marker: "X",
      name: "Player 1 (Computer)",
      type: :ai,
      logic: AiLogic
    }

  def human_player1,
    do: %Player{
      marker: "X",
      name: "Player 1",
      type: :human,
      logic: nil
    }

  def human_player2,
    do: %Player{
      marker: "O",
      name: "Player 2",
      type: :human,
      logic: nil
    }

  def new_game_p2p,
    do: %Game{
      board: new_board(),
      current_player: human_player1(),
      next_player: human_player2()
    }

  def in_progress_game_p2p,
    do: %Game{
      board: full_board(),
      current_player: human_player1(),
      next_player: human_player2()
    }

  def new_game_ai,
    do: %Game{
      board: new_board(),
      current_player: ai_player(),
      next_player: human_player2()
    }

  def mock_board(cell_nums, marker, size) do
    Enum.to_list(1..size)
    |> add_moves(cell_nums, marker)
  end

  def mock_board([{player1_moves, player1_marker}, {player2_moves, player2_marker}], size) do
    Enum.to_list(1..size)
    |> add_moves(player1_moves, player1_marker)
    |> add_moves(player2_moves, player2_marker)
  end

  defp add_moves(board, cell_nums, marker) do
    cell_nums
    |> Enum.map(&(&1 - 1))
    |> Enum.reduce(board, &List.replace_at(&2, &1, marker))
  end
end
