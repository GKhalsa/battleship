require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/board.rb'
require_relative '../lib/ship.rb'

class BoardTest < Minitest::Test

  def test_board_has_a_class
    board = Board.new
    assert_equal Board, board.class
  end

  def test_board_has_a_layout
    board = Board.new
    layout = {:a=>["A", " ", " ", " ", " "], :b=>["B", " ", " ", " ", " "], :c=>["C", " ", " ", " ", " "], :d=>["D", " ", " ", " ", " "]}
    assert_equal layout, board.grid
  end

  def test_can_build_a_starting_board_for_ai
    board_type = :ai
    board = Board.new(board_type)
    assert_equal 2, board.ship_locations.count
  end

  def test_can_human_build_a_board?
    board = Board.new
    board.setup_human_board_with_ship('a1 a2', 'uBoat')
    assert_equal 1, board.ship_locations.count
  end

  def test_cant_build_a_second_ship_if_it_overlaps_the_first
    board = Board.new
    board.setup_human_board_with_ship('a1 a2', 'uBoat')
    board.setup_human_board_with_ship('a1 a2', 'uBoat')
    assert_equal 1, board.ship_locations.count
  end

  def test_can_build_a_second_ship_if_it_doesnt_overlap_the_first
    board = Board.new
    board.setup_human_board_with_ship('a1 a2', 'uBoat')
    board.setup_human_board_with_ship('a3 b1', 'uBoat')
    assert_equal 2, board.ship_locations.count
  end

  def test_can_draw_grid_after_creating_ships
    board = Board.new
    board.setup_human_board_with_ship('a1 a2', 'uBoat')
    board.setup_human_board_with_ship('a3 b1', 'uBoat')
    assert_equal nil, board.draw_grid
  end

  def test_ship_is_not_sunk_when_starting_out
    board = Board.new
    board.setup_human_board_with_ship('a1 a2', 'uBoat')
    assert_equal false, board.ship_locations[0].sunk
  end

  def test_ship_locations
    board = Board.new
    board.setup_human_board_with_ship('a1 a2', 'uBoat')
    assert_equal '*', board.grid[:a][1]
  end

  def test_if_ship_can_have_response_to_being_hit
    board = Board.new
    board.setup_human_board_with_ship('a1 a2', 'uBoat')
    assert_equal "\e[31mIt's a hit! \e[0m", board.is_a_hit?('a1')
  end

  def test_that_there_is_a_message_for_a_missed_shot
    board = Board.new
    board.setup_human_board_with_ship('a1 a2', 'uBoat')
    assert_equal "\e[34mNo hit, I repeat no hit!\e[0m", board.is_a_hit?('ab1')
  end

  def test_ship_can_be_sunk
    board = Board.new
    board.setup_human_board_with_ship('a1 a2', 'uBoat')
    board.is_a_hit?('a1')
    assert_equal false, board.ship_locations[0].sunk
    board.is_a_hit?('a2')
    assert_equal true, board.ship_locations[0].sunk
  end

  meta single:true
  def test_get_response_for_downing_a_ship
    board = Board.new
    board.setup_human_board_with_ship('a1 a2', 'uBoat')
    board.is_a_hit?('a1')
    assert_equal "\e[31mIt's a hit! \e[0muBoat is down!", board.is_a_hit?('a2')
  end

end
