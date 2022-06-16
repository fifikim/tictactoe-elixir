defmodule TicTacToe.Validation do
  alias TicTacToe.Board
  alias TicTacToe.Game

  def check_selection(
        selection,
        %Game{
          board: %Board{cells: cells} = board,
          current_player: current_player,
          next_player: next_player
        } = game
      ) do
    cond do
      invalid_character?(selection, game) ->
        {:error, "You must select a number between 1 and #{List.last(cells)}."}

      Board.space_occupied?(to_index(selection), board, [
        current_player.marker,
        next_player.marker
      ]) ->
        {:error, "That cell has already been taken."}

      true ->
        {:ok, to_index(selection)}
    end
  end

  defp invalid_character?(input, %Game{board: %Board{cells: cells}}) do
    cells
    |> List.last()
    |> then(&Regex.compile("^[1-#{&1}]$"))
    |> elem(1)
    |> Regex.match?(input)
    |> Kernel.not()
  end

  defp to_index(input), do: String.to_integer(input) - 1
end
