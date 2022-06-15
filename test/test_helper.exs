ExUnit.start()

defmodule TestHelpers do
  alias TicTacToe.Board
  alias TicTacToe.Game
  alias TicTacToe.Player

  def new_board do
    %Board{cells: [1, 2, 3, 4, 5, 6, 7, 8, 9]}
  end

  def in_progress_board do
    %Board{cells: ["X", "O", "X", "O", "X", "O", "X", "O", 9]}
  end

  def full_board do
    %Board{cells: ["X", "X", "X", "X", "X", "O", "O", "O", "O"]}
  end

  def default_player1 do
    %Player{
      marker: "X",
      name: "Player 1",
      turn_msg: "Player 1's turn:",
      type: :human
    }
  end

  def default_player2 do
    %Player{
      marker: "O",
      name: "Player 2",
      turn_msg: "Player 2's turn:",
      type: :human
    }
  end

  def new_game do
    %Game{
      board: new_board(),
      current_player: default_player1(),
      game_over: false,
      markers: ["X", "O"],
      players: %{player1: default_player1(), player2: default_player2()},
      size: 9
    }
  end

  def in_progress_game do
    %Game{
      board: in_progress_board(),
      current_player: default_player1(),
      game_over: false,
      markers: ["X", "O"],
      players: %{player1: default_player1(), player2: default_player2()},
      size: 9
    }
  end

  def full_game do
    %Game{
      board: full_board(),
      current_player: default_player1(),
      game_over: true,
      markers: ["X", "O"],
      players: %{player1: default_player1(), player2: default_player2()},
      size: 9
    }
  end
end
