defmodule TicTacToe.ValidationTest do
  alias TicTacToe.Validation
  use ExUnit.Case

  describe "Validation.menu_selection/2" do
    for {input, description} <- TestHelpers.invalid_inputs() do
      test "returns {:error, \"invalid selection\"} when input is #{description}" do
        assert Validation.menu_selection(unquote(input), TestHelpers.game_options()) ==
                 {:error, "You must choose from the numbers listed above."}
      end
    end

    test "returns {:ok, index} when the selection is valid" do
      selection = "1"
      assert Validation.menu_selection(selection, TestHelpers.game_options()) == {:ok, 0}
    end
  end

  describe "Validation.cell_selection/2" do
    for {input, description} <- TestHelpers.invalid_inputs() do
      test "returns {:error, \"invalid selection\"} when input is #{description}" do
        assert Validation.cell_selection(unquote(input), TestHelpers.new_game_p2p()) ==
                 {:error, "You must select a number between 1 and 9."}
      end
    end

    test "returns {:error, \"cell is occupied\"} when selected cell is occupied" do
      selection = "1"

      assert Validation.cell_selection(selection, TestHelpers.in_progress_game_p2p()) ==
               {:error, "That cell has already been taken."}
    end

    test "returns {:ok, index} when the selection is valid" do
      selection = "1"
      assert Validation.cell_selection(selection, TestHelpers.new_game_p2p()) == {:ok, 0}
    end
  end
end
