# frozen_string_literal: true

require 'matrix'
require_relative './board_printing'

# Class to manage the Tic Tac Toe
# Game board general behavior.
class Board
  include BoardPrinting
  attr_reader :current_player, :board_structure

  def initialize(empty_token)
    # Setup an empty 3x3 board and save
    # the available tokens data.
    @board_structure = Matrix.build(3) { Token.new }
    @empty_token = empty_token
  end

  def self.row_or_column_occupied_by_player_tokens?(current_player_token, vectors)
    # Count the tokens that the current player
    # has placed in board's each row and
    # check if any of them was filled.
    vectors.any? do |row|
      row.count { |token| current_player_token.class::TOKEN_CHARACTER == token.class::TOKEN_CHARACTER } >= 3
    end
  end

  def self.diagonal_occupied_by_player_tokens?(current_player_token, diagonal_vector)
    # Count the tokens that the current player
    # has placed in board's specified diagonal
    # and check if it was filled.
    diagonal_vector.all? { |token| current_player_token.class::TOKEN_CHARACTER == token.class::TOKEN_CHARACTER }
  end

  private

  def board_position_is_empty?(row, column)
    @empty_token.class::TOKEN_CHARACTER == @board_structure[row, column].class::TOKEN_CHARACTER
  end

  def rotate_board
    Matrix[*@board_structure.to_a.map(&:reverse).transpose]
  end

  public

  def all_positions_are_occupied?
    @board_structure.count { |token| token.class::TOKEN_CHARACTER == @empty_token.class::TOKEN_CHARACTER } <= 0
  end

  def row_occupied_by_player_tokens?(current_player_token)
    Board.row_or_column_occupied_by_player_tokens?(current_player_token, @board_structure.row_vectors)
  end

  def column_occupied_by_player_tokens?(current_player_token)
    Board.row_or_column_occupied_by_player_tokens?(current_player_token, @board_structure.column_vectors)
  end

  def normal_diagonal_occupied_by_player_tokens?(current_player_token)
    Board.diagonal_occupied_by_player_tokens?(current_player_token, @board_structure.each(:diagonal).to_a)
  end

  def inverse_diagonal_occupied_by_player_tokens?(current_player_token)
    Board.diagonal_occupied_by_player_tokens?(current_player_token, rotate_board.each(:diagonal).to_a)
  end

  def put_current_player_token(current_player_token, row, column)
    return 'Board\'s position already occupied' unless board_position_is_empty?(row, column)

    @board_structure[row, column] = current_player_token
  end
end
