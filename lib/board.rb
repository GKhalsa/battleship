class Board
  attr_reader :grid
  def initialize
    @grid = {A:["A"," "," "," "," "], B:["B"," "," "," "," "], C:["C"," "," "," "," "], D:["D"," "," "," "," "] }
    @ship_locations = [] #[['a1','a2'],['b2','b3','b4']] #ship objects
  end

  def draw_grid
    #puts =========
    grid.each do |key, spaces|
      spaces.join(" ")
      #if I put a letter in the array, then the spaces would be 1-4 and not 0-3
    end
    #puts =========
  end

  def add_ship(input)
    # if can_ship_be_created?(input)
    @ship_locations #<<
    #if can_ship_be_created
    #input.create_ship
    #input = ship object
    #ship139483 @occupied_spaces = {'A1' => nil, 'A2' => nil}
  end

  def what_ships?
  end

  def can_ship_be_created?(input) #a1
    board = [*('a'..'d'), *('1'..'4')]
    board_check = input.chars.all? {|location| board.include?(location)}
    ship_check = !@ship_locations.flatten.include?(input)
    board_check && ship_check
  end

  def populate_grid
  end

  def is_a_hit?(input)
    @ship_locations.flatten.include?("B4")
    #ship1.ship_locations.each do |location, status|
      #if location == input
         #ship1[location] = true
        #@grid[:B][4] = "H"
      #end
  end

  def ship_validation

    #scan ship objects and see if a ship has all falses
    #if so say ship_object.name is sunk
    #change ship.sunk to true
  end

  end

  def show_hit_on_grid
  end

end
