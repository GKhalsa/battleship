require 'pry'
class Ship
  attr_reader :length, :name
  attr_accessor :spaces

  def initialize(name, length)
    @name = name
    @length = length
    @sunk = false
    @spaces = Array.new(length, false)
  end

  def sunk?
    spaces.all? {|space| space == true} ? @sunk = true : @sunk = false
  end

end
