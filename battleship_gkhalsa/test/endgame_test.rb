require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/endgame.rb'

class EndgameTest < Minitest::Test

  def test_for_final_message
    endgame = Endgame.new
    assert_equal ' ', endgame.final_message(80, 60, true, 5)
  end
end
