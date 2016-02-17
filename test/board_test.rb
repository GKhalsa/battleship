require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/board.rb'

class BoardTest < Minitest::Test
  def board_has_a_class
    board = Board.new
    assert_equal Board, board.class
  end

  def board_has_a_layout
    board = Board.new
    assert_equal , board.spaces
  end

  def board_can_add_a_ship
    board = Board.new
    ship = Ship.new
    board.add_ship(ship)
    board.what_ships?
    board.ship_locations
    board.validate_ship
    board.sunk_ship?
  end
end
