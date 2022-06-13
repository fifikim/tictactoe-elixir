defmodule TicTacToe.Players do
  alias TicTacToe.Player

  defstruct player1: %Player{name: "Player 1", marker: "X"},
            player2: %Player{name: "Player 2", marker: "O"}
end
