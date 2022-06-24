defmodule TicTacToe.Player do
  alias TicTacToe.ConsoleIO
  alias TicTacToe.Player

  defstruct type: nil,
            name: nil,
            marker: nil,
            logic: nil

  def select_cell, do: ConsoleIO.input()
  def select_cell(%Player{logic: ai_logic}), do: ai_logic
end
