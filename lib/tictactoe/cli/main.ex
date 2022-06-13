defmodule TicTacToe.CLI.Main do
  alias TicTacToe.Board

  import TicTacToe.CLI.Console

  def start_game do
    display_instructions()
    play()
  end

  defp play do
    display_board(%Board{})
  end
end
