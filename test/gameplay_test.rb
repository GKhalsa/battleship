require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/gameplay.rb'

class GameplayTest < Minitest::Test

  def test_a_new_gameplay_starts_with_two_board_and_has_ships
    gameplay = Gameplay.new

    assert_equal 2, gameplay.ai_board.ship_locations.count
    assert_equal 0, gameplay.players_board
  end

  def test_players_board_starts_with_zero_ships
    gameplay = Gameplay.new

    assert_equal 0, gameplay.players_board
  end

  def test_player_can_shoot_and_hit_a_ship
    gameplay = Gameplay.new

    assert gameplay.player_fire_missile('a1')
  end

  def test_player_can_shoot_and_not_hit
    gameplay = Gameplay.new

    refute gameplay.player_fire_missile('c1')
  end

  meta single:true
  def test_if_player_hits_all_locations_boat_is_sunk
    gameplay = Gameplay.new

    gameplay.player_fire_missile('a1')
    gameplay.player_fire_missile('a2')

    assert_equal "uBoat is down!", gameplay.boat_response
  end
end
