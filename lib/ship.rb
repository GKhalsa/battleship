require 'pry'
class Ship
  attr_reader :length, :name
  attr_accessor :occupied_spaces

  def initialize(name, length)
    @name = name
    @length = length
    @sunk = false
    @occupied_spaces = {}#Array.new(length, false)
  end

  def sunk?
    # spaces.all? {|space| space == true} ? @sunk = true : @sunk = false
    occupied_spaces.all? {|position, status| status == true }
  end

  def create_ship(input)
    input.each { |position| occupied_spaces[position] = false
  end

  def ship_validation
      #see board class
  end
    #create ships
    #"A1","A2" @spaces << [['A1',nil],['A2',nil]
    #spaces = {'A1' => nil, 'A2' => nil}

end

#ship_1 = [["A1",nil], ["A2", nil]]
#ship_1.map! do |space, peg|
#  [space, peg = true] if guess == space
#end
