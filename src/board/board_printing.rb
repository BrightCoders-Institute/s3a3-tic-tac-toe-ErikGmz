# frozen_string_literal: true

# Module to control Tic Tac Toe
# game board printing logic.
module BoardPrinting
  def print_board(board)
    print_board_columns_numbers(board)
    print_ui_space
    board.row_vectors.each_with_index do |row, row_index|
      print_board_row(row, row_index)
    end
    print_ui_space
    puts '||---------------------------------------------------||'
  end

  def print_board_columns_numbers(board)
    print '||   '
    board.column_size.times { |column| print "    #{column + 1} " }
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

  def print_ui_space
    puts '||                                                   ||'
  end
end
