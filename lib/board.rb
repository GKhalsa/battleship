require_relative 'ship.rb'
class Board
  attr_reader :grid, :ship_locations

  def initialize(board_type = nil)
    @grid = {A:["A"," "," "," "," "], B:["B"," "," "," "," "], C:["C"," "," "," "," "], D:["D"," "," "," "," "] }
    @ship_locations = []
    setup_ai_board if board_type == :ai
  end

  def setup_ai_board
    ship_1 = Ship.new("uBoat", "a1 a2")
    ship_2 = Ship.new("Destroyer","b1 b3")
    @ship_locations << ship_1
    @ship_locations << ship_2
  end

  def setup_human_board_with_first_ship(input)
    if can_ship_be_created?(input)
      ship_1 = Ship.new("uBoat", input)
      @ship_locations << ship_1
    end
  end

  def setup_human_board_with_second_ship(input)
    if can_ship_be_created?(input)
      ship_2 = Ship.new("Destroyer", input)
      @ship_locations << ship_2
    end
  end

  def draw_grid
    #puts =========
    grid.each do |key, spaces|
      spaces.join(" ")
      #if I put a letter in the array, then the spaces would be 1-4 and not 0-3
    end
    #puts =========
  end

  # def add_ship(input)
  #   # if can_ship_be_created?(input)
  #   @ship_locations #<<
  #   #if can_ship_be_created
  #   #input.create_ship
  #   #input = ship object
  #   #ship139483 @occupied_spaces = {'A1' => nil, 'A2' => nil}
  # end

  def what_ships?
    @ship_locations
  end

  def can_ship_be_created?(input)
    board = [*('a'..'d'), *('1'..'4')]
    board_check = input.delete(' ').chars.all? {|location| board.include?(location)}
      if @ship_locations.empty?
        ship_check = true
      else
        ship_check = can_ship_be_created_extension(input)
      end
    board_check && ship_check
  end

  def can_ship_be_created_extension(input)
    overlap = @ship_locations.map {|ship| ship.occupied_spaces.keys & input.split}
    if overlap.flatten.empty?
      true
    else
      false  #send overlap to user
    end
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

  def show_hit_on_grid
  end

end
