defmodule TicTacToe.AiLogic do
  alias TicTacToe.Board
  alias TicTacToe.WinFinder

  def find_best_cell(cells, markers) do
    {index, _score} = score_free_cells(cells, markers, true)
    index
  end

  defp score_free_cells(cells, markers, is_ai) do
    cells
    |> reject_occupied(markers)
    |> Enum.map(&score_possible_move(&1, markers, cells, is_ai))
    |> sort_scores(is_ai)
    |> List.first()
  end

  defp reject_occupied(cells, markers) do
    cells
    |> Enum.with_index()
    |> Enum.reject(fn {_value, index} -> Board.space_occupied?(index, cells, markers) end)
  end

  defp score_possible_move({_value, index}, markers, cells, is_ai) do
    index
    |> simulate_new_board(markers, cells, is_ai)
    |> get_score(markers, is_ai)
    |> then(&{index, &1})
  end

  defp simulate_new_board(index, [ai_marker, _], cells, is_ai) when is_ai,
    do: Board.update(index, ai_marker, cells)

  defp simulate_new_board(index, [_, human_marker], cells, _is_ai),
    do: Board.update(index, human_marker, cells)

  defp get_score(%Board{cells: updated_cells}, [ai_marker, human_marker] = markers, is_ai) do
    cond do
      WinFinder.game_won?(updated_cells, ai_marker) -> 1
      WinFinder.game_won?(updated_cells, human_marker) -> -1
      Board.full?(updated_cells, markers) -> 0
      true -> find_best_score(updated_cells, markers, !is_ai)
    end
  end

  defp sort_scores(scores_list, is_ai) when is_ai,
    do: Enum.sort_by(scores_list, fn {_index, score} -> score end, :desc)

  defp sort_scores(scores_list, _is_ai),
    do: Enum.sort_by(scores_list, fn {_index, score} -> score end, :asc)

  defp find_best_score(cells, markers, is_ai) do
    {_index, score} = score_free_cells(cells, markers, is_ai)
    score
  end
end
