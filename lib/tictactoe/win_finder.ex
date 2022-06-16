defmodule TicTacToe.WinFinder do
  alias TicTacToe.Board

  def game_won?(%Board{cells: cells}, marker) do
    cells
    |> get_combos()
    |> Enum.any?(&combo_in_board?(&1, cells, marker))
  end

  defp combo_in_board?(combination, cells, marker),
    do: Enum.all?(combination, &marker_at_index?(&1, cells, marker))

  defp marker_at_index?(index, cells, marker), do: Enum.at(cells, index) == marker

  defp get_combos(cells) do
    max = Enum.count(cells)
    array = Enum.to_list(0..(max - 1))
    get_rows(array) ++ get_columns(array) ++ get_diagonals(array)
  end

  defp get_rows(cells), do: Enum.chunk_every(cells, row_length(cells))

  defp get_columns(cells) do
    cells
    |> get_rows()
    |> List.zip()
    |> Enum.map(&Tuple.to_list/1)
  end

  defp get_diagonals(cells) do
    max = Enum.count(cells)
    length = row_length(cells)
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

  defp row_length(cells) do
    cells
    |> length()
    |> :math.sqrt()
    |> trunc()
  end
end
