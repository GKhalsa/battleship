require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ship.rb'

class ShipTest < Minitest::Test

  def test_exists
    ship = Ship.new("uBoat",2)
    assert_equal Ship, ship.class
  end

  def test_ship_starts_with_a_length
    ship = Ship.new("uBoat",2)
    assert_equal 2, ship.length
  end

  def test_ship_starts_unsunk
    ship = Ship.new("uBoat",2)
    assert_equal false, ship.sunk?
  end

  def test_ship_starts_with_spaces
    ship = Ship.new("uBoat", 2)
    assert_equal [false,false], ship.spaces
  end

  def test_ship_is_sunk
    ship = Ship.new("uBoat", 2)
    ship.spaces = [true,true]
    assert ship.sunk?
  end

  def test_ship_has_name
    ship = Ship.new("uBoat", 2)
    assert_equal "uBoat", ship.name
  end

end
