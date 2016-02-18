require 'pry'
class Ship
  attr_reader :name
  attr_accessor :occupied_spaces, :sunk, :notified_user

  def initialize(name, positions)
    @name = name
    @sunk = false
    @occupied_spaces = {}
    @notified_user = false
    create_ship(positions)
  end

  def sunk?
    @sunk
  end

  def create_ship(positions)
    positions.split.each { |position| occupied_spaces[position] = nil }
  end

end
