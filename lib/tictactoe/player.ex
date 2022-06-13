defmodule TicTacToe.Player do
  defstruct name: nil,
            marker: nil

  defimpl String.Chars do
    def to_string(player), do: player.name
  end
end
