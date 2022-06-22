# defmodule TicTacToe.AiLogic do
#   alias TicTacToe.Board
#   alias TicTacToe.ConsoleIO
#   alias TicTacToe.Game
#   alias TicTacToe.WinFinder

#   def find_best(cells, [ai_marker, next_player_marker] = markers) do
#     # filter out occupied spaces & score each space
#     Enum.to_list(0..(length(cells) - 1))
#     |> Enum.map(&Enum.at(cells, &1))
#     |> Enum.with_index()
#     |> Enum.reject(&occupied?(&1, cells, markers))
#     |> Enum.map(&score_move(&1, ai_marker, cells, true))

#     # find highest score
#     # return cell_num
#   end

#   defp occupied?({value, index}, cells, markers) do
#     Board.space_occupied?(index, cells, markers)
#   end

#   def score_move({cell_num, index}, ai_marker, cells, Maximizing) do
#     score =
#       index
#       |> Board.update(ai_marker, cells)
#       |> minimax()

#     {cell_num, score}
#   end

#   # def high_score({cell_num, score})

#   def minimax(board), do: 1

#   defp to_index(input), do: String.to_integer(input) - 1
#   defp to_cell_num(index), do: Integer.to_string(index + 1)
# end
