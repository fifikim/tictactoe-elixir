defmodule TicTacToe.CLI.PlayerMenuTest do
  alias TicTacToe.CLI.PlayerMenu
  alias TicTacToe.Game
  alias TicTacToe.Player
  use ExUnit.Case
  import ExUnit.CaptureIO

  describe "PlayerMenu.select_opponent/0" do
    test "prints the player menu" do
      assert capture_io("1", fn ->
               PlayerMenu.select_opponent()
             end) =~ "Who would you like to play against?"
    end

    test "prints the list of player type options" do
      assert capture_io("1", fn ->
               PlayerMenu.select_opponent()
             end) =~
               "1 - Another player\n2 - Computer"
    end

    test "returns human vs human game if player selects 1" do
      {%Game{current_player: %Player{type: opponent_type}}, _output} =
        assert with_io("1", fn ->
                 PlayerMenu.select_opponent()
               end)

      assert opponent_type == :human
    end

    test "returns human vs computer game if player selects 2" do
      {%Game{current_player: %Player{type: opponent_type}}, _output} =
        assert with_io("2", fn ->
                 PlayerMenu.select_opponent()
               end)

      assert opponent_type == :ai
    end

    for {input, description} <- TestHelpers.invalid_inputs() do
      test "reprompts user to choose again if selection is #{description}" do
        assert capture_io([input: "#{unquote(input)}\n1"], fn ->
                 PlayerMenu.select_opponent()
               end) =~
                 "Invalid selection! You must choose from the numbers listed above. Please try again:"
      end
    end
  end
end
