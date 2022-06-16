ExUnit.start()

defmodule TestHelpers do
  alias TicTacToe.Board
  alias TicTacToe.Game
  alias TicTacToe.Player

  def new_board, do: %Board{cells: [1, 2, 3, 4, 5, 6, 7, 8, 9]}

  def in_progress_board, do: %Board{cells: ["X", "O", "X", "O", "X", "O", "X", "O", 9]}

  def winning_board, do: %Board{cells: ["X", "X", "X", "O", 5, "O", 7, 8, 9]}

  def full_board, do: %Board{cells: ["X", "X", "X", "X", "X", "O", "O", "O", "O"]}

  def default_player1 do
    %Player{
      marker: "X",
      name: "Player 1",
      type: :human
    }
  end

  def default_player2 do
    %Player{
      marker: "O",
      name: "Player 2",
      type: :human
    }
  end

  def new_game do
    %Game{
      board: new_board(),
      current_player: default_player1(),
      next_player: default_player2(),
      game_status: :active
    }
  end

  def in_progress_game do
    %Game{
      board: in_progress_board(),
      current_player: default_player1(),
      next_player: default_player2(),
      game_status: :active
    }
  end

  def full_game do
    %Game{
      board: full_board(),
      current_player: default_player1(),
      next_player: default_player2(),
      game_status: :drawn
    }
  end
end
