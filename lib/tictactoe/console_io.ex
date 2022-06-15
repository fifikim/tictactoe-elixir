defmodule TicTacToe.ConsoleIO do
  alias TicTacToe.Board
  alias TicTacToe.Game

  def input, do: IO.gets("") |> String.trim()

  def output(message), do: IO.puts(message)

  def greeting, do: output("Welcome to Tic Tac Toe!\n")

  def new_game, do: output("Starting new game...\n")

  def instructions(%Game{} = game) do
    game
    |> build_instructions()
    |> output()
  end

  def selection_error(:char, size),
    do: output("Invalid selection! Please select a number between 1 and #{size}:")

  def selection_error(:occupied, _size),
    do: output("Invalid selection! Please select a free space:")

  def game_won(name), do: output("Game over! #{name} wins!")

  def goodbye, do: output("Thanks for playing! Goodbye.")

  def display_board(%Board{cells: cells}) do
    length = row_length(cells)

    cells
    |> Enum.chunk_every(length)
    |> Enum.map_join(horizontal_line(length), &format_row(&1))
    |> then(&"#{&1}\n")
    |> output()
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
    |> then(&"\n#{&1}\n")
  end

  defp build_instructions(%Game{
         board: %Board{cells: cells},
         players: %{player1: player1, player2: player2},
         size: size
       }) do
    length = row_length(cells)

    """
    Instructions
    Enter the number (1-#{size}) of the space on the board where you want to move.
    #{player1.name} moves first and marks their spaces with an "#{player1.marker}". #{player2.name} marks with an "#{player2.marker}".
    To win, claim #{length} adjacent spaces in a horizontal, vertical, or diagonal line.
    If there are no free spaces and no player has won, the game will end in a draw.
    """
  end
end
