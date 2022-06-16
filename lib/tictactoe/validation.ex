defmodule TicTacToe.Validation do
  alias TicTacToe.Board
  alias TicTacToe.Game
  alias TicTacToe.Player

  def check_selection(
        selection,
        %Game{
          board: %Board{cells: cells} = board,
          current_player: %Player{marker: current_player_marker},
          next_player: %Player{marker: next_player_marker}
        } = game
      ) do
    cond do
      invalid_character?(selection, game) ->
        {:error, "You must select a number between 1 and #{Enum.count(cells)}."}

      Board.space_occupied?(to_index(selection), board, [
        current_player_marker,
        next_player_marker
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
