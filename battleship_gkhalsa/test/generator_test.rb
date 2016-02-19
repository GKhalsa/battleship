require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/generator.rb'

class GeneratorTest < Minitest::Test

  def test_generator_returns_a_uniq_array
    generator = Generator.new
    test_array = []
    test_array << generator.valid_positions
    assert_equal 5, test_array.flatten.uniq.count
  end
end
