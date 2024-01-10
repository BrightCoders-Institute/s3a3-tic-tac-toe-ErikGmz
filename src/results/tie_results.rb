# frozen_string_literal: true

require_relative './results'

# Class to specify a tie
# Tic Tac Toe game results
# structure.
class TieResults < Results
  def initialize(_winner = -1)
    super
    @message = 'La partida ha finalizado en empate'
  end
end
