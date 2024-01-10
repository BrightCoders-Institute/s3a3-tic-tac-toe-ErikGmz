# frozen_string_literal: true

# Class to specify a general
# Tic Tac Toe game results
# structure.
class Results
  attr_reader :message

  def initialize(winner = -1)
    @message = "El jugador no. #{format('%02i', winner)} ha ganado la partida"
  end
end
