defmodule TicTacToe.ValidationTest do
  alias TicTacToe.Validation
  use ExUnit.Case

  @invalid_inputs [
    {"t", "not a number"},
    {"100", "out-of-range number"},
    {"", "empty"}
  ]

  describe "Validation.check_selection/2" do
    for {input, description} <- @invalid_inputs do
      test "returns {:error, \"invalid selection\"} when input is #{description}" do
        assert Validation.check_selection(unquote(input), TestHelpers.new_game()) ==
                 {:error, "You must select a number between 1 and 9."}
      end
    end

    test "returns {:error, \"cell is occupied\"} when selected cell is occupied" do
      selection = "1"

      assert Validation.check_selection(selection, TestHelpers.in_progress_game()) ==
               {:error, "That cell has already been taken."}
    end

    test "returns {:ok, index} when the selection is valid" do
      selection = "1"
      assert Validation.check_selection(selection, TestHelpers.new_game()) == {:ok, 0}
    end
  end
end
