defmodule TicTacToe.Player do
  alias TicTacToe.AiLogic
  alias TicTacToe.Board
  alias TicTacToe.ConsoleIO

  defstruct type: nil,
            name: nil,
            marker: nil

  def select_cell(:ai, %Board{cells: cells}, markers), do: AiLogic.find_best_cell(cells, markers)
  def select_cell(:human, _board, _markers), do: ConsoleIO.input()
end
