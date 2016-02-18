require_relative 'board.rb'

class Gameplay
  attr_accessor :ai_board
  def initialize
    @ai_board ||= Board.new(:ai)
  end

  def players_board
    player_board = Board.new(:human)
    player_board.ship_locations.count
  end

  def player_fire_missile(missile_guess)
    ai_board.is_a_hit?(missile_guess)
  end

  def ship_check
    ai_board.ship_validation
  end


end
