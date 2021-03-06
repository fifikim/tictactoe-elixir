defmodule TicTacToe.Board do
  alias TicTacToe.Board

  defstruct cells: nil

  def update(index, marker, cells) do
    cells
    |> List.replace_at(index, marker)
    |> then(&%Board{cells: &1})
  end

  def space_occupied?(index, cells, markers) do
    cells
    |> Enum.at(index)
    |> is_marker?(markers)
  end

  def full?(cells, markers), do: Enum.all?(cells, &is_marker?(&1, markers))

  def row_length(cells) do
    cells
    |> length()
    |> :math.sqrt()
    |> trunc()
  end

  defp is_marker?(value, markers), do: Enum.member?(markers, value)
end
