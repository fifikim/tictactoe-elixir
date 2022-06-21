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
    |> is_marker?(markers)
  end

  def full?(%Board{cells: cells}, markers), do: Enum.all?(cells, &is_marker?(&1, markers))

  defp is_marker?(value, markers), do: Enum.member?(markers, value)

  def row_length(cells) do
    cells
    |> length()
    |> :math.sqrt()
    |> trunc()
  end
end
