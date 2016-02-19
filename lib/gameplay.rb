require_relative 'board.rb'
require_relative 'responses.rb'

class Gameplay
  attr_accessor :ai_board, :player_board, :player_ship_input
  def initialize
    @ai_board ||= Board.new(:ai)
    @player_board = Board.new(:human)
    @player_ship_input = []
    game_engine
  end

  def game_engine
    start_game_with_ai_message
    ship_selecting
    firing_engine
  end

  def start_game_with_ai_message
    Responses.ai_ship_placement
  end

  def ship_selecting
    player_enter_ship(gets.chomp.downcase)
  end

  def player_enter_ship(input)
    validate(input)
  end

  def validate(input)
    invalid_chars = [*('e'..'z'), '0',*('5'..'9')]
    if !input.include?(' ')
      puts "enter some spaces matey!"
      ship_selecting
    elsif invalid_chars.any? {|char| input.include?(char)}
      puts "not a valid character matey!"
      ship_selecting
    elsif input.delete(' ').length < 4
      puts "not enough characters!"
      ship_selecting
    elsif player_ship_input.flatten & input.split != []
      puts 'you already included that space!'
      ship_selecting
    elsif player_ship_input.empty?
      @player_ship_input << input.split
      player_board.setup_human_board_with_ship(input)
      Responses.second_ship
      player_enter_ship(gets.chomp)
    elsif !player_ship_input.empty?
      player_board.setup_human_board_with_ship(input)
      Responses.finished_up_ship_placement
    end
  end

  def firing_engine
    #draw grid
  end

  def players_board
    player_board = Board.new(:human)
    player_board.ship_locations.count
  end

  def player_fire_missile(missile_guess)
    ai_board.is_a_hit?(missile_guess)
  end

  def ship_check
    ai_board.ship_validation
  end

  def boat_response
    ai_board.ship_response
    #if both ships are all true, activate end game
  end

  def draw_board(missile_guess)
    ai_board.update_grid(missile_guess)
  end

  def end_game
  end


end
