require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ship.rb'

class ShipTest < Minitest::Test

  def test_exists
    ship = Ship.new("uBoat",'a1 a2')
    assert_equal Ship, ship.class
  end

  def test_ship_starts_with_a_false_notification
    ship = Ship.new("uBoat",'a1 a2')
    assert_equal false, ship.notified_user
  end

  def test_ship_starts_unsunk
    ship = Ship.new("uBoat",'a2 a3')
    assert_equal false, ship.sunk?
  end

  def test_ship_creates_spaces
    ship = Ship.new("uBoat", 'c1 c2')
    assert_equal({"c1"=>nil, "c2"=>nil}, ship.occupied_spaces)
  end

  def test_ship_has_name
    ship = Ship.new("uBoat", 'c1 c2')
    assert_equal "uBoat", ship.name
  end

end
