# defmodule TicTacToe.WinFinder do
#   alias TicTacToe.Board
#   alias TicTacToe.WinFinder

#   def game_won?(%Board{cells: cells} = board, marker) do
#     get_rows(cells)
#   end

#   defp get_rows(cells) do
#     Enum.chunk_every(cells, row_length(cells))
#   end

#   defp get_columns(cells) do

#   end

#   defp get_diagonals(cells) do

#   end

#   defp row_length(cells) do
#     cells
#     |> length()
#     |> :math.sqrt()
#     |> trunc()
#   end
# end
