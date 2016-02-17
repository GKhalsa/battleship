require 'pry'
class Ship
  attr_reader :name
  attr_accessor :occupied_spaces

  def initialize(name)
    @name = name
    @sunk = false
    @occupied_spaces = {} #{'A1' => nil, 'A2' => nil}
  end

  def sunk?
    @sunk
  end

  def create_ship(input) #'a1'
    input.chars.each { |position| occupied_spaces[position] = nil
  end

  def ship_validation
      #see board class
  end

end
