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
      if output == 'q'
        puts "see you later aligator!"
        break
      end
    end
  end

end

rep = Repl.new
