require_relative 'responses.rb'

class Battleship
  include Responses

  def initialize
    Responses.initial_game_message
  end

  def processor_of_inputs(input)
    input
  end

end
