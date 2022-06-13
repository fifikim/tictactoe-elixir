defmodule TicTacToe.CLI.Console do
  def display_greeting do
    IO.puts("Welcome to Tic Tac Toe!\n")
    IO.puts(instructions())
    IO.puts("Starting new game...\n")
  end

  def display_board(board) do
    length = row_length(board.cells)

    board.cells
    |> Enum.chunk_every(length)
    |> Enum.map_join(horizontal_line(length), &format_row(&1))
    |> IO.puts()
  end

  defp row_length(cells) do
    cells
    |> length()
    |> :math.sqrt()
    |> trunc()
  end

  defp format_row(row_array) do
    row_array
    |> Enum.map_join("|", &format_cell(&1))
  end

  defp format_cell(cell) do
    " #{cell} "
  end

  defp horizontal_line(length) do
    separator =
      List.duplicate("---", length)
      |> Enum.join("|")

    "\n#{separator}\n"
  end

  defp instructions do
    """
    Instructions:
    Enter the number (1-9) of the space on the board where you want to move.
    Player 1 moves first and marks their spaces with an "X". Player 2 marks with an "O".
    To win, claim 3 adjacent spaces in a horizontal, vertical, or diagonal line.
    If there are no free spaces and no player has won, the game will end in a draw.
    """
  end
end
