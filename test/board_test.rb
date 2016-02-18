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
    layout = {:A=>["A", " ", " ", " ", " "], :B=>["B", " ", " ", " ", " "], :C=>["C", " ", " ", " ", " "], :D=>["D", " ", " ", " ", " "]}
    assert_equal layout, board.grid
  end

  def test_draw_grid
    board = Board.new
    layout = {:A=>["A", " ", " ", " ", " "], :B=>["B", " ", " ", " ", " "], :C=>["C", " ", " ", " ", " "], :D=>["D", " ", " ", " ", " "]}
    assert_equal layout, board.draw_grid
  end

  def test_can_build_a_starting_board_for_ai
    board_type = :ai
    board = Board.new(board_type)
    assert_equal 2, board.ship_locations.count
  end

  meta single:true
  def test_can_human_build_a_board?
    board = Board.new
    board.setup_human_board_with_first_ship('a1 a2')
    assert_equal 1, board.ship_locations.count
  end

  def test_cant_build_a_second_ship_if_it_overlaps_the_first
    board = Board.new
    board.setup_human_board_with_first_ship('a1 a2')
    board.setup_human_board_with_second_ship('a1 a2')
    assert_equal 1, board.ship_locations.count
  end

  def test_can_build_a_second_ship_if_it_doesnt_overlap_the_first
    board = Board.new
    board.setup_human_board_with_first_ship('a1 a2')
    board.setup_human_board_with_second_ship('a3 b1')
    assert_equal 2, board.ship_locations.count
  end

end
