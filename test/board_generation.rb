# frozen_string_literal: true

require_relative '../src/board/board'
require_relative '../src/board_tokens/token'

# Module to generate test boards.
module BoardGeneration
  def fill_empty_board_with_row_or_column(tokens_list, fill_row, position)
    board = Matrix.build(3) { Token.new }
    if fill_row
      board[position, (0...board.column_count)] = tokens_list
    else
      board[(0...board.row_count), position] = tokens_list
    end
    board
  end

  def generate_completely_filled_board
    Matrix[[XCrossToken.new, HollowCircleToken.new, HollowCircleToken.new],
           [HollowCircleToken.new, XCrossToken.new, XCrossToken.new],
           [XCrossToken.new, HollowCircleToken.new, HollowCircleToken.new]]
  end

  def generate_diagonal_board(player_tokens_row)
    empty_board = Matrix.build(3) { Token.new }
    3.times { |number| empty_board[number, number] = player_tokens_row.class.new }
    empty_board
  end

  def rotate_diagonal_board(diagonal_board)
    Matrix[*diagonal_board.to_a.map(&:reverse).transpose]
  end
end
