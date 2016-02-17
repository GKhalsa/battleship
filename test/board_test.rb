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
    layout = { A:[" "," "," "," "], B:[" "," "," "," "], C:[" "," "," "," "], D:[" "," "," "," "] }
    assert_equal layout, board.grid
  end

  def test_draw_grid
    board = Board.new
    layout = { A:[" ", " ", " ", " "], B:[" ", " ", " ", " "], C:[" ", " ", " ", " "], D:[" ", " ", " ", " "] }
    assert_equal layout, board.draw_grid
  end

  def test_board_can_add_a_ship
    board = Board.new
    ship = Ship.new("uBoat", 2)
    board.add_ship(ship)
    board.what_ships?
    board.validate_ship
  end
end
