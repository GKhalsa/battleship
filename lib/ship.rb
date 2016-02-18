require 'pry'
class Ship
  attr_reader :name
  attr_accessor :occupied_spaces

  def initialize(name, positions)
    @name = name
    @sunk = false
    @occupied_spaces = {} #{'A1' => nil, 'A2' => nil}
    create_ship(positions)
  end

  def sunk?
    @sunk
  end

  def create_ship(positions) #'a1 a2'.split=> ['a1','a2']
    positions.split.each { |position| occupied_spaces[position] = nil }
  end

  def ship_validation
      #see board class
  end

end
