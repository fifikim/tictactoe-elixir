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

  def player_menu(options) do
    output("Who would you like to play against?")

    options_with_number = Enum.with_index(options, 1)

    for {{label, _game}, number} <- options_with_number do
      output("#{number} - #{label}")
    end
  end

  def turn_message(%Player{name: name, type: :ai}) do
    output("#{name} is processing its move:\n")
  end

  def turn_message(%Player{name: name, type: :human}), do: output("#{name}'s move:")

  def selection_error(reason),
    do: output("Invalid selection! #{reason} Please try again:")

  def game_over(:won, cells, name) do
    display_board(cells)
    output("Game over! #{name} wins!")
  end

  def game_over(:draw, cells) do
    display_board(cells)
    output("Game over! It's a draw!")
  end

  def goodbye, do: output("Thanks for playing! Goodbye.")

  def display_board(cells) do
    length = Board.row_length(cells)

    cells
    |> Enum.chunk_every(length)
    |> Enum.map_join(horizontal_line(length), &format_row(&1))
    |> then(&"#{&1}\n")
    |> output()
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
         current_player: %Player{marker: current_player_marker, name: current_player_name},
         next_player: %Player{marker: next_player_marker, name: next_player_name}
       }) do
    length = Board.row_length(cells)
    size = Enum.count(cells)

    """
    Instructions
    Enter the number (1-#{size}) of the space on the board where you want to move.
    #{current_player_name} moves first and marks their spaces with an "#{current_player_marker}". #{next_player_name} marks with an "#{next_player_marker}".
    To win, claim #{length} adjacent spaces in a horizontal, vertical, or diagonal line.
    If there are no free spaces and no player has won, the game will end in a draw.
    """
  end
end
