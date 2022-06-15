defmodule TicTacToe.ValidationTest do
  alias TicTacToe.Validation
  use ExUnit.Case

  test "Validation.check_selection/2 returns {:ok, index} when the selection is valid" do
    selection = "1"
    assert Validation.check_selection(selection, TestHelpers.new_game()) == {:ok, 0}
  end

  test "Validation.check_selection/2 returns {:char, game} when input is a not an integer" do
    selection = "t"
    {error, _game} = Validation.check_selection(selection, TestHelpers.new_game())
    assert error == :char
  end

  test "Validation.check_selection/2 returns {:char, game} when input is an out-of-range number" do
    selection = "100"
    {error, _game} = Validation.check_selection(selection, TestHelpers.new_game())
    assert error == :char
  end

  test "Validation.check_selection/2 returns {:char, game} when input is empty" do
    selection = ""
    {error, _game} = Validation.check_selection(selection, TestHelpers.new_game())
    assert error == :char
  end

  test "Validation.check_selection/2 returns {:occupied, game} when selected space is occupied" do
    selection = "1"
    {error, _game} = Validation.check_selection(selection, TestHelpers.in_progress_game())
    assert error == :occupied
  end
end
