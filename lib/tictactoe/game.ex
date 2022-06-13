defmodule TicTacToe.Game do
  alias TicTacToe.Board
  alias TicTacToe.Players

  defstruct board: %Board{},
            current_player: nil,
            game_over: false
end
