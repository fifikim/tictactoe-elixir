defmodule TicTacToe.ValidationTest do
  alias TicTacToe.Validation
  use ExUnit.Case

  test "Validation.check_selection/2 returns {:ok, index} when the selection is valid" do
    selection = "1"
    assert Validation.check_selection(selection, TestHelpers.new_game()) == {:ok, 0}
  end

  test "Validation.check_selection/2 returns {:error, \"invalid selection\"} when input is a not an integer" do
    selection = "t"

    assert Validation.check_selection(selection, TestHelpers.new_game()) ==
             {:error, "You must select a number between 1 and 9."}
  end

  test "Validation.check_selection/2 returns {:error, \"invalid selection\"} when input is an out-of-range number" do
    selection = "100"

    assert Validation.check_selection(selection, TestHelpers.new_game()) ==
             {:error, "You must select a number between 1 and 9."}
  end

  test "Validation.check_selection/2 returns {:error, \"invalid selection\"} when input is empty" do
    selection = ""

    assert Validation.check_selection(selection, TestHelpers.new_game()) ==
             {:error, "You must select a number between 1 and 9."}
  end

  test "Validation.check_selection/2 returns {:error, \"cell is occupied\"} when selected cell is occupied" do
    selection = "1"

    assert Validation.check_selection(selection, TestHelpers.in_progress_game()) ==
             {:error, "That cell has already been taken."}
  end
end
