module Responses

  def self.initial_game_message
    puts "Welcome to BATTLESHIP"

    puts "\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def self.instructions
    puts "You will be prompted to placed two ships on the board. After you will exchange fire with an evil AI mastermind whose soul purpose in life is to cause you unbelievable amounts of pain, so please win to spite it. Just kidding it is super friendly and reasonable but has no care as to whether or not you are happy and fulfilled in life and or breathing. The next step is to choose squares at which to fire. There is a grid from A to D and from 1 - 4. You will choose to fire by entering inputs such as A2 or B4. You will be told as to whether you hit the opponent or it was a miss followed by a grid of your shot history. Good luck and may the best man(ish) win!"
  end

  def self.ai_ship_placement
    puts "\tI have laid out my ships on the grid.
        You now need to layout your two ships.
        The first is two units long and the
        second is three units long.
        The grid has A1 at the top left and D4 at the bottom right.

        Enter the squares for the two-unit ship:"
  end

  def self.second_ship
    puts "Enter a second ship, this time with more firepower! Remember, you need to enter three consecutive locations such as B1 B2 B3"
  end

  def self.finished_up_ship_placement
    puts "Alright, ya finished up yer ship bulding didge ya, let's begin! Remember to fire from A1 to D4!" 
  end

end
