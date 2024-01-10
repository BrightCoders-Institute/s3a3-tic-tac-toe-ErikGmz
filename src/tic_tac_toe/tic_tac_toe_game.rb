# frozen_string_literal: true

require_relative '../board/board'
require_relative '../board_tokens/token'
require_relative '../board_tokens/x_cross_token'
require_relative '../board_tokens/hollow_circle_token'
require_relative '../results/results'
require_relative '../results/tie_results'

# Class to control the Tic Tac
# Toe Game general behavior.
class TicTacToeGame
  EMPTY_TOKEN = Token.new
  PLAYERS_TOKENS = [XCrossToken.new, HollowCircleToken.new].freeze

  def initialize
    # Give to x-cross token player the first turn.
    @players_queue = PLAYERS_TOKENS.dup
    @current_player = @players_queue[0]
    @board = Board.new(EMPTY_TOKEN)
  end

  private

  def loop_turns
    turn_results = nil
    loop do
      next if manage_turn.is_a?(String)

      turn_results = game_is_finished?
      break unless turn_results.nil?
    end

    print_ui
    puts "#{turn_results.message}."
  end

  def manage_turn
    print_ui
    run_turn
  end

  def print_ui
    clear_screen
    print_header
    @board.print_board(@board.board_structure)
    puts ''
  end

  def clear_screen
    if Gem.win_platform?
      system('cls')
    else
      system('clear')
    end
  end

  def print_header
    first_player_text = current_player_text(PLAYERS_TOKENS[0])
    second_player_text = current_player_text(PLAYERS_TOKENS[1])

    puts '||-----------------Juego Tic-Tac-Toe-----------------||'
    print_ui_space
    puts "|| Ficha del primer jugador  ---> #{format('%-19.19s', first_player_text)}||"
    puts "|| Ficha del segundo jugador ---> #{format('%-19.19s', second_player_text)}||"
    print_ui_space
    puts '||---------------------------------------------------||'
    print_ui_space
  end

  def print_ui_space
    puts '||                                                   ||'
  end

  def current_player_text(player)
    player_token_character = player.class::TOKEN_CHARACTER
    player_token_character.dup.concat(@current_player == player ? ' (actual)' : '')
  end

  def run_turn
    token_coordinates = ask_current_player_data
    @board.put_current_player_token(@current_player, *token_coordinates)
  end

  def ask_current_player_data
    token_data = []
    token_data.push(ask_token_coordinate('fila') - 1)
    token_data.push(ask_token_coordinate('columna') - 1)
    token_data
  end

  def ask_token_coordinate(coordinate_name)
    coordinate = -1
    loop do
      print "Introduzca el número de #{coordinate_name} en la que se posicionará la ficha (1 - 3): "
      coordinate = gets.chomp.to_i
      raise ArgumentError unless (1..3).include?(coordinate)

      break
    rescue ArgumentError
      puts "Es necesario introducir un número entre 1 y 3.\n"
    end
    coordinate
  end

  def game_is_finished?
    results = nil
    results = TieResults.new if @board.all_positions_are_occupied?

    if @board.row_occupied_by_player_tokens?(@current_player) ||
       @board.column_occupied_by_player_tokens?(@current_player) ||
       @board.normal_diagonal_occupied_by_player_tokens?(@current_player) ||
       @board.inverse_diagonal_occupied_by_player_tokens?(@current_player)
      results = Results.new(@current_player.class::PLAYER)
    end

    switch_current_player if results.nil?
    results
  end

  def switch_current_player
    @players_queue.rotate!
    @current_player = @players_queue[0]
  end

  public

  def start_game
    loop_turns
  rescue StandardError => e
    puts 'Un error ha ocurrido durante el juego.'
    puts e.full_message
  end
end
