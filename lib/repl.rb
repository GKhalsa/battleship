require_relative 'battleship.rb'
require 'pry'
class Repl

  def initialize
    @battleship = Battleship.new
    game_loop
  end

  def game_loop
    loop do
      output = @battleship.processor_of_inputs(gets.chomp)
      # binding.pry
      break if output == 'q'
    end
    #return nil
  end

end

rep = Repl.new
