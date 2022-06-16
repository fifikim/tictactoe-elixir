defmodule TicTacToe.Player do
  alias TicTacToe.ConsoleIO

  defstruct type: nil,
            name: nil,
            marker: nil

  def select_cell, do: ConsoleIO.input()
end
