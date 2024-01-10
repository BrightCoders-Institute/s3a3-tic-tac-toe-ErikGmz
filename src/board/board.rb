# frozen_string_literal: true

require 'matrix'
require_relative '../board_tokens/token'
require_relative '../board_tokens/x_cross_token'
require_relative '../board_tokens/hollow_circle_token'
require_relative '../results/results'

# Class to manage the Tic Tac Toe
# Game board general behavior.
class Board
  attr_reader :current_player

  def initialize(empty_token)
    # Setup an empty 3x3 board and save
    # the available tokens data.
    @board_structure = Matrix.build(3) { Token.new }
    @empty_token = empty_token
  end

  private

  def board_position_is_empty?(row, column)
    @empty_token.class::TOKEN_CHARACTER == @board_structure[row, column].class::TOKEN_CHARACTER
  end

  def row_or_column_occupied_by_player_tokens?(current_player_token, vectors)
    # Count the tokens that the current player
    # has placed in board's each row and
    # check if any of them was filled.
    vectors.any? do |row|
      row.count { |token| current_player_token.class::TOKEN_CHARACTER == token.class::TOKEN_CHARACTER } >= 3
    end
  end

  def rotate_board
    Matrix[*@board_structure.to_a.map(&:reverse).transpose]
  end

  def diagonal_occupied_by_player_tokens?(current_player_token, diagonal_vector)
    # Count the tokens that the current player
    # has placed in board's specified diagonal
    # and check if it was filled.
    diagonal_vector.all? { |token| current_player_token.class::TOKEN_CHARACTER == token.class::TOKEN_CHARACTER }
  end

  def print_board_columns_numbers
    print '||   '
    @board_structure.column_size.times { |column| print "    #{column + 1} " }
    print ' '
    print_board_right_padding
  end

  def print_board_right_padding
    puts format('%-31.31s', (' ' * 29).concat('||'))
  end

  def print_board_row(row, row_index)
    print_board_row_space(row.size)
    print_board_row_token(row, row_index)
    print_board_row_space(row.size)
    print_board_row_line(row, row_index)
  end

  def print_board_row_space(columns_number)
    print '||     '
    print '     |' * (columns_number - 1)
    print '     '
    print_board_right_padding
  end

  def print_board_row_token(row, row_index)
    print "||  #{row_index + 1}  "
    row.each_with_index do |token, token_index|
      print "  #{token.class::TOKEN_CHARACTER}  #{token_index >= row.size - 1 ? '' : '|'}"
    end
    print_board_right_padding
  end

  def print_board_row_line(row, row_index)
    return unless row_index < @board_structure.row_count - 1

    print '||     '
    print '------' * (row.size - 1)
    print '-----'
    print_board_right_padding
  end

  public

  def all_positions_are_occupied?
    @board_structure.count { |token| token.class::TOKEN_CHARACTER == @empty_token.class::TOKEN_CHARACTER } <= 0
  end

  def row_occupied_by_player_tokens?(current_player_token)
    row_or_column_occupied_by_player_tokens?(current_player_token, @board_structure.row_vectors)
  end

  def column_occupied_by_player_tokens?(current_player_token)
    row_or_column_occupied_by_player_tokens?(current_player_token, @board_structure.column_vectors)
  end

  def normal_diagonal_occupied_by_player_tokens?(current_player_token)
    diagonal_occupied_by_player_tokens?(current_player_token, @board_structure.each(:diagonal).to_a)
  end

  def inverse_diagonal_occupied_by_player_tokens?(current_player_token)
    diagonal_occupied_by_player_tokens?(current_player_token, rotate_board.each(:diagonal).to_a)
  end

  def put_current_player_token(current_player_token, row, column)
    return 'Board\'s position already occupied' unless board_position_is_empty?(row, column)

    @board_structure[row, column] = current_player_token
  end

  def print_board
    print_board_columns_numbers
    puts '||                                                   ||'
    @board_structure.row_vectors.each_with_index do |row, row_index|
      print_board_row(row, row_index)
    end
    puts '||                                                   ||'
    puts '||---------------------------------------------------||'
  end
end
