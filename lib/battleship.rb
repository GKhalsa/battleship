require_relative 'responses.rb'

class Battleship
  def initialize   
  end

  def initialize
    Responses.initial_game_message
  end

  def processor_of_inputs(input)
    case input[0]
    when 'i'
      Responses.instructions
    when 'q'
      'q'
    when 'p'
      #
    end
  end

end
