defmodule TicTacToe.AiLogicTest do
  alias TicTacToe.AiLogic
  use ExUnit.Case

  @test_boards [
    %{
      description: "AI selects index 0 when there are no occupied cells",
      expected: 0,
      cells: TestHelpers.mock_board([], "X", 9)
    },
    %{
      description:
        "AI selects index of winning move when it's in a winning position and human player is not",
      expected: 2,
      cells:
        TestHelpers.mock_board(
          player1_marker: "X",
          player1_moves: [1, 2],
          player2_marker: "O",
          player2_moves: [4, 9],
          size: 9
        )
    },
    %{
      description:
        "AI selects index of a blocking move when human player is in a winning position and AI is not",
      expected: 0,
      cells:
        TestHelpers.mock_board(
          player1_marker: "X",
          player1_moves: [3, 7],
          player2_marker: "O",
          player2_moves: [5, 9],
          size: 9
        )
    },
    %{
      description:
        "AI selects index of a winning move instead of a blocking move when both players are in winning positions",
      expected: 6,
      cells:
        TestHelpers.mock_board(
          player1_marker: "X",
          player1_moves: [1, 4],
          player2_marker: "O",
          player2_moves: [3, 6],
          size: 9
        )
    }
  ]

  describe "AiLogic.find_best_cell/2" do
    for %{description: description, expected: expected, cells: cells} <- @test_boards do
      test "#{description}" do
        assert AiLogic.find_best_cell(unquote(cells), ["X", "O"]) == unquote(expected)
      end
    end
  end
end
