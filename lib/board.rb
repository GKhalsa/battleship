require_relative 'ship.rb'
require_relative 'string.rb'
require_relative 'generator.rb'

class Board
  attr_reader :grid, :ship_locations, :ai_positions

  def initialize(board_type = nil)
    @grid = {a:["A"," "," "," "," "], b:["B"," "," "," "," "], c:["C"," "," "," "," "], d:["D"," "," "," "," "] }
    @ai_positions = Generator.new
    @ship_locations = []
    setup_ai_board if board_type == :ai
  end

  def setup_ai_board
    ship_1 = Ship.new("uBoat", ai_positions.two_spot_generation.downcase)
    ship_2 = Ship.new("Destroyer", ai_positions.three_spot_generation.downcase)
    ship_locations << ship_1
    ship_locations << ship_2
  end

  def setup_human_board_with_ship(input, name)
    if can_ship_be_created?(input)
      ship = Ship.new(name, input)
      ship_locations << ship
      user_ship_locations_grid(input)
    end
  end

  def draw_grid
    puts "========="
    puts ". 1 2 3 4"
    grid.each do |key, spaces|
      puts spaces.join(" ")
    end
    puts "========="
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

  def can_ship_be_created_extension(input)
    overlap = ship_locations.map {|ship| ship.occupied_spaces.keys & input.split}
    overlap.flatten.empty? ? true : false
  end

  def update_grid_if_ship_is_hit(missile_guess)
    symbol = missile_guess.chars[0].to_sym
    position = missile_guess.chars[1].to_i
    grid[symbol][position] = 'H'
  end

  def user_ship_locations_grid(input)
    input.split.each do |coordinates|
      sym = coordinates.chars[0].to_sym
      index = coordinates.chars[1].to_i
      grid[sym][index] = '*'
    end
  end

  def is_a_hit?(missile_guess)
    hits = []
    notify_user = "No hit, I repeat no hit!".blue
    ship_locations.each do |ship|
      ship_coordinates = ship.occupied_spaces.keys
      if ship_coordinates.include?(missile_guess)
        hit_location = ship_coordinates & missile_guess.split
        ship.occupied_spaces[hit_location.join] = true
        ship_validation
        update_grid_if_ship_is_hit(missile_guess)
        notify_user = user_missile_response
        hits << missile_guess
      else
        update_grid_if_ship_not_hit(missile_guess)
      end
      hits.each {|hit| update_grid_if_ship_is_hit(hit)}
      hits = []
    end
    notify_user
  end

  def ship_validation
    ship_locations.each do |ship|
      if ship.occupied_spaces.values.all?
        ship.sunk = true
      end
    end
   end

  def update_grid_if_ship_not_hit(missile_guess)
    symbol = missile_guess.chars[0].to_sym
    position = missile_guess.chars[1].to_i
    grid[symbol][position] = 'M'
  end

  def user_missile_response
    response = "It's a hit! ".red
    response << ship_response
  end

  def ship_response
    response = ""
    ship_locations.each do |ship|
      if ship.sunk && ship.notified_user == false
        response << "#{ship.name} is down!"
        ship.notified_user = true
      end
    end
    response
  end

end
