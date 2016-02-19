require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/gameplay.rb'

class GameplayTest < Minitest::Test

  def test_a_new_gameplay_starts_with_two_board_and_has_ships
    gameplay = Gameplay.new

    assert_equal 2, gameplay.ai_board.ship_locations.count
    assert_equal 0, gameplay.player_board.ship_locations.count
  end

  def test_players_board_starts_with_zero_ships
    gameplay = Gameplay.new

    assert_equal 0, gameplay.player_board.ship_locations.count
  end

  def test_player_can_shoot_and_hit_a_ship
    gameplay = Gameplay.new

    assert gameplay.ai_board.is_a_hit?('b2')
  end

  def test_player_can_shoot_and_not_hit
    gameplay = Gameplay.new

    refute gameplay.ai_board.is_a_hit?('c1')
  end

  def test_when_player_hits_it_changes_board
    gameplay = Gameplay.new
    gameplay.ai_board.is_a_hit?('a1')

    assert_equal nil, gameplay.ai_board.draw_grid
  end

  def test_if_player_hits_all_locations_boat_is_sunk
    gameplay = Gameplay.new
    gameplay.ai_board.is_a_hit?('a1')
    gameplay.ai_board.is_a_hit?('a2')

    assert_equal nil, gameplay.ai_board.draw_grid
  end

  def test_ai_fire
    gameplay = Gameplay.new
    gameplay.ai_fire
    assert gameplay.ai_missile
  end

  def test_for_endgame
    gameplay = Gameplay.new

    gameplay.game_check_adjust([4],[0])
    assert_equal false, gameplay.ai_win

    gameplay.game_check_adjust([5],[0])
    assert_equal true, gameplay.ai_win
  end

end
