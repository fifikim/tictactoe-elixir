defmodule TicTacToe.Board do
  alias TicTacToe.Board

  defstruct cells: nil

  def update(index, marker, %Board{cells: cells}) do
    cells
    |> List.replace_at(index, marker)
    |> then(&%Board{cells: &1})
  end

  def space_occupied?(index, %Board{cells: cells}, markers) do
    cells
    |> Enum.at(index)
    |> then(&is_marker?(markers, &1))
  end

  def full?(%Board{cells: cells}, markers) do
    Enum.all?(cells, &is_marker?(markers, &1))
  end

  defp is_marker?(markers, value) do
    Enum.member?(markers, value)
  end
end
