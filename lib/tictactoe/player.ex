defmodule TicTacToe.Player do
  alias TicTacToe.ConsoleIO
  alias TicTacToe.Player

  defstruct type: nil,
            name: nil,
            marker: nil,
            logic: nil

  def select_cell, do: ConsoleIO.input()

  def select_cell(%Player{logic: ai_logic}, cells, markers),
    do: ai_logic.find_best_cell(cells, markers)
end
