defmodule TicTacToe.ConsoleIO do
  alias TicTacToe.Board
  alias TicTacToe.Game
  alias TicTacToe.Player

  def input, do: String.trim(IO.gets(""))

  def output(message), do: IO.puts(message)

  def greeting, do: output("Welcome to Tic Tac Toe!\n")

  def new_game, do: output("Starting new game...\n")

  def instructions(%Game{} = game) do
    game
    |> build_instructions()
    |> output()
  end

  def turn_message(%Player{name: name, type: :human}), do: output("#{name}'s turn:")

  def selection_error(reason),
    do: output("Invalid selection! #{reason} Please try again:")

  def game_won(%Board{} = board, %Player{name: name}) do
    display_board(board)
    output("Game over! #{name} wins!")
  end

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
         current_player: current_player,
         next_player: next_player
       }) do
    length = row_length(cells)
    size = List.last(cells)

    """
    Instructions
    Enter the number (1-#{size}) of the space on the board where you want to move.
    #{current_player.name} moves first and marks their spaces with an "#{current_player.marker}". #{next_player.name} marks with an "#{next_player.marker}".
    To win, claim #{length} adjacent spaces in a horizontal, vertical, or diagonal line.
    If there are no free spaces and no player has won, the game will end in a draw.
    """
  end
end
