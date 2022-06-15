defmodule TicTacToe.Validation do
  alias TicTacToe.Board
  alias TicTacToe.Game

  def check_selection(selection, %Game{board: %Board{} = board, markers: markers} = game) do
    cond do
      invalid_character?(selection, game) -> {:char, game}
      Board.space_occupied?(to_index(selection), board, markers) -> {:occupied, game}
      true -> {:ok, to_index(selection)}
    end
  end

  defp invalid_character?(input, %Game{size: size}) do
    Regex.compile("^[1-#{size}]$")
    |> elem(1)
    |> Regex.match?(input)
    |> Kernel.not()
  end

  defp to_index(input), do: String.to_integer(input) - 1
end
