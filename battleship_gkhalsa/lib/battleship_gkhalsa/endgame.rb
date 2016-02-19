require_relative 'battleship.rb'
class Endgame
  attr_reader :rounds

  def initialize
  end

  def final_message(start, finish, human_win, rounds)
    time = (finish - start).to_i.divmod 60
    if human_win
      puts "Congratulations! You beat the hunt for the Red October in #{rounds} rounds! This took #{time[0]} minutes and #{time[1]} seconds"
    else
      puts "Sorry, computer wins! You played #{rounds} rounds which took #{time[0]} minutes and #{time[1]} seconds"
    end
    puts "would you like to (p)lay again or (q)uit?"
    replay(gets.chomp.delete(' ').downcase)
  end

  def replay(input)
    if input[0] == 'p'
      Battleship.new
    elsif input[0] == 'q'
      'thanks for playing!'
      abort
    else
      puts "that's not a valid response"
    end
  end

end
