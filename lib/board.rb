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
    ship_locations << ship_1
    ship_locations << ship_2
  end

  def setup_human_board_with_first_ship(input)
    if can_ship_be_created?(input)
      ship_1 = Ship.new("uBoat", input)
      ship_locations << ship_1
    end
  end

  def setup_human_board_with_second_ship(input)
    if can_ship_be_created?(input)
      ship_2 = Ship.new("Destroyer", input)
      ship_locations << ship_2
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

  def what_ships?
    ship_locations
  end

  def can_ship_be_created?(input)
    board = [*('a'..'d'), *('1'..'4')]
    board_check = input.delete(' ').chars.all? {|location| board.include?(location)}
      if ship_locations.empty?
        ship_check = true
      else
        ship_check = can_ship_be_created_extension(input)
      end
    board_check && ship_check
  end
  #^^ make ship_check default true, then change if the else is true

  def can_ship_be_created_extension(input)
    overlap = ship_locations.map {|ship| ship.occupied_spaces.keys & input.split}
    if overlap.flatten.empty?
      true
    else
      false  #send overlap to user
    end
  end

  def populate_grid
  end

  def is_a_hit?(missile_guess)
    ship_locations.any? do |ship|
      ship_coordinates = ship.occupied_spaces.keys
      if ship_coordinates.include?(missile_guess)
        hit_location = ship_coordinates & missile_guess.split
        ship.occupied_spaces[hit_location.join] = true
        ship_validation
        #say hit here instead of true and run ship_validation
      end
    end
  end

  def ship_validation
    ship_locations.each do |ship|
      if ship.occupied_spaces.values.all?
        ship.sunk = true
      end
    end
  end

  def ship_response
    response = []
    ship_locations.each do |ship|
      if ship.sunk && ship.notified_user == false
        response << "#{ship.name} is down!"
        ship.notified_user = true
      end
    end
    response
  end

  def show_hit_on_grid
  end

end
