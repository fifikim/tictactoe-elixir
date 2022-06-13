defmodule TicTacToe.CLI.Console do
  alias TicTacToe.Board

  @instructions """
  Instructions:
  Enter the number (1-9) of the space on the board where you want to move.
  Player 1 moves first and marks their spaces with an "X". Player 2 marks with an "O".
  To win, claim 3 adjacent spaces in a horizontal, vertical, or diagonal line.
  If there are no free spaces and no player has won, the game will end in a draw.
  """

  def instructions do
    IO.puts("Welcome to Tic Tac Toe!\n")
    IO.puts(@instructions)
    IO.puts("Starting new game...\n")
  end

  def display_board(%Board{cells: cells}) do
    length = row_length(cells)

    cells
    |> Enum.chunk_every(length)
    |> Enum.map_join(horizontal_line(length), &format_row(&1))
    |> IO.puts()
  end

  def display_turn(player) do
    IO.puts("#{player}'s turn:")
  end

  def invalid_selection do
    IO.puts("Invalid selection! Please try again.")
  end

  def game_won do
    IO.puts("Game over! Someone won!")
  end

  def goodbye do
    IO.puts("Thanks for playing! Goodbye.")
  end

  defp row_length(cells) do
    cells
    |> length()
    |> :math.sqrt()
    |> trunc()
  end

  defp format_row(row_array), do: Enum.map_join(row_array, "|", &format_cell(&1))

  defp format_cell(cell), do: " #{cell} "

  defp horizontal_line(length) do
    "---"
    |> List.duplicate(length)
    |> Enum.join("|")
    |> then(fn separator -> "\n#{separator}\n" end)
  end
end
