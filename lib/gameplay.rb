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
    ai_board.ship_locations.any? do |ship|
      ship_coordinates = ship.occupied_spaces.keys
      if ship_coordinates.include?(missile_guess)
        hit_location = ship_coordinates & missile_guess.split
        ship.occupied_spaces[hit_location.join] = true
      end
    end
  end

  def ship_check
    @ai_board
  end


end
