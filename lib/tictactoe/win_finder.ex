defmodule TicTacToe.WinFinder do
  alias TicTacToe.Board

  def game_won?(cells, marker) do
    cells
    |> get_combos()
    |> Enum.any?(&combo_found?(&1, cells, marker))
  end

  defp combo_found?(combination, cells, marker),
    do: Enum.all?(combination, &marker_at_index?(&1 - 1, cells, marker))

  defp marker_at_index?(index, cells, marker), do: Enum.at(cells, index) == marker

  defp get_combos(cells) do
    cell_nums =
      cells
      |> Enum.count()
      |> then(&Enum.to_list(1..&1))

    get_rows(cell_nums) ++ get_columns(cell_nums) ++ get_diagonals(cell_nums)
  end

  defp get_rows(cells), do: Enum.chunk_every(cells, Board.row_length(cells))

  defp get_columns(cells) do
    cells
    |> get_rows()
    |> List.zip()
    |> Enum.map(&Tuple.to_list/1)
  end

  defp get_diagonals(cells) do
    max = Enum.count(cells)
    length = Board.row_length(cells)
    first = down_and_right(1, max, length + 1)
    second = down_and_left(length, max, length - 1)

    [first, second]
  end

  defp down_and_right(num, max, _distance) when num > max, do: []

  defp down_and_right(num, max, distance),
    do: [num] ++ down_and_right(num + distance, max, distance)

  defp down_and_left(num, max, _distance) when num >= max, do: []

  defp down_and_left(num, max, distance),
    do: [num] ++ down_and_left(num + distance, max, distance)
end
