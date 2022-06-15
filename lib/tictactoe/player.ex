defmodule TicTacToe.Player do
  alias TicTacToe.ConsoleIO

  defstruct type: nil,
            name: nil,
            marker: nil,
            turn_msg: nil

  def select_cell do
    ConsoleIO.input()
  end

  defimpl String.Chars do
    def to_string(player), do: player.name
  end
end
