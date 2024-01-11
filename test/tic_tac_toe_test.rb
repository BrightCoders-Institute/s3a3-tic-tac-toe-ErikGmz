# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../src/tic_tac_toe/tic_tac_toe_game'
require_relative '../src/board/board'
require_relative '../src/board_tokens/token'
require_relative '../src/board_tokens/x_cross_token'
require_relative '../src/board_tokens/hollow_circle_token'
require_relative '../src/results/results'
require_relative '../src/results/tie_results'
require_relative './board_generation'

# Class to test Tic Tac Toe game general
# behavior with results calculations.
class TicTacToeTest < Minitest::Test
  include BoardGeneration

  def setup
    @tic_tac_toe_game = TicTacToeGame.new
    @game_board = @tic_tac_toe_game.instance_variable_get(:@board)
  end

  private

  def check_game_completion(board, results_type, winner)
    @game_board.instance_variable_set(:@board_structure, board)
    game_results = @tic_tac_toe_game.send(:game_is_finished?)

    assert_kind_of results_type, game_results
    assert_equal winner, game_results.instance_variable_get(:@winner) unless winner.nil?
  end

  def check_player_rows(player_tokens_row, results_type, player_number)
    @tic_tac_toe_game.instance_variable_set(:@current_player, player_tokens_row)
    @game_board.board_structure.row_count.times do |row_index|
      check_game_completion(fill_empty_board_with_row_or_column(player_tokens_row, true, row_index),
                            results_type, player_number)
    end
  end

  def check_player_columns(player_tokens_row, results_type, player_number)
    @tic_tac_toe_game.instance_variable_set(:@current_player, player_tokens_row)
    @game_board.board_structure.column_count.times do |column_index|
      check_game_completion(fill_empty_board_with_row_or_column(player_tokens_row, false, column_index),
                            results_type, player_number)
    end
  end

  def check_player_diagonal(player_tokens_row, results_type, player_number)
    @tic_tac_toe_game.instance_variable_set(:@current_player, player_tokens_row)
    check_game_completion(generate_diagonal_board(player_tokens_row), results_type, player_number)
  end

  def check_player_inverse_diagonal(player_tokens_row, results_type, player_number)
    @tic_tac_toe_game.instance_variable_set(:@current_player, player_tokens_row)
    check_game_completion(rotate_diagonal_board(generate_diagonal_board(player_tokens_row)),
                          results_type, player_number)
  end

  def test_player_game_completion(player_token, results_type, player_number)
    check_player_rows(player_token, results_type, player_number)
    check_player_columns(player_token, results_type, player_number)
    check_player_diagonal(player_token, results_type, player_number)
    check_player_inverse_diagonal(player_token, results_type, player_number)
  end

  public

  def test_normal_game_uncompletion
    assert_nil @tic_tac_toe_game.send(:game_is_finished?)
  end

  def test_players_game_completion
    test_player_game_completion(XCrossToken.new, Results, 1)
    test_player_game_completion(HollowCircleToken.new, Results, 2)
  end

  def test_tie_game
    check_game_completion(generate_completely_filled_board, TieResults, nil)
  end
end
