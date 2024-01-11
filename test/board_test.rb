# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../src/board/board'
require_relative '../src/board_tokens/token'
require_relative '../src/board_tokens/x_cross_token'
require_relative '../src/board_tokens/hollow_circle_token'
require_relative '../src/results/results'
require_relative '../src/results/tie_results'
require_relative './board_generation'

# Class to test Tic Tac Toe game general
# behavior with results calculations.
class BoardTest < Minitest::Test
  include BoardGeneration

  def setup
    @board = Board.new(Token.new)
  end

  private

  def check_board_rows(player_tokens_row)
    @board.board_structure.row_count.times do |row_index|
      @board.instance_variable_set(:@board_structure, fill_empty_board_with_row_or_column(player_tokens_row,
                                                                                          true,
                                                                                          row_index))
      assert @board.row_occupied_by_player_tokens?(player_tokens_row)
      refute @board.all_positions_are_occupied?
    end
  end

  def check_board_columns(player_tokens_row)
    @board.board_structure.column_count.times do |column_index|
      @board.instance_variable_set(:@board_structure, fill_empty_board_with_row_or_column(player_tokens_row,
                                                                                          false,
                                                                                          column_index))
      assert @board.column_occupied_by_player_tokens?(player_tokens_row)
      refute @board.all_positions_are_occupied?
    end
  end

  def check_board_diagonal(player_tokens_row)
    @board.instance_variable_set(:@board_structure, generate_diagonal_board(player_tokens_row))
    assert @board.normal_diagonal_occupied_by_player_tokens?(player_tokens_row)
    refute @board.all_positions_are_occupied?
  end

  def check_board_inverse_diagonal(player_tokens_row)
    @board.instance_variable_set(:@board_structure, rotate_diagonal_board(generate_diagonal_board(player_tokens_row)))
    assert @board.inverse_diagonal_occupied_by_player_tokens?(player_tokens_row)
    refute @board.all_positions_are_occupied?
  end

  def test_player_token_board_filling(player_token)
    check_board_rows(player_token)
    check_board_columns(player_token)
    check_board_diagonal(player_token)
    check_board_inverse_diagonal(player_token)
  end

  public

  def test_board_filling
    test_player_token_board_filling(XCrossToken.new)
    test_player_token_board_filling(HollowCircleToken.new)
  end

  def test_completely_filled_board
    @board.instance_variable_set(:@board_structure, generate_completely_filled_board)
    assert @board.all_positions_are_occupied?

    @board.board_structure.each_with_index do |token, row, column|
      refute @board.send(:board_position_is_empty?, row, column)
      assert_kind_of String, @board.put_current_player_token(token, row, column)
    end
  end

  def test_empty_board
    @board.instance_variable_set(:@board_structure, Matrix.build(3) { Token.new })
    refute @board.all_positions_are_occupied?

    @board.board_structure.each_with_index do |token, row, column|
      assert @board.send(:board_position_is_empty?, row, column)
      assert_kind_of Token, @board.put_current_player_token(token, row, column)
    end
  end
end
