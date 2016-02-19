require_relative 'board.rb'
require_relative 'responses.rb'

class Gameplay
  attr_reader :rounds, :ai_board, :player_board, :player_ship_input, :player_missile_guesses, :ai_missile

  def initialize
    @ai_board = Board.new(:ai)
    @player_board = Board.new(:human)
    @player_ship_input = []
    @player_missile_guesses = []
    @ai_missile = []
    @endgame = false
    @ai_win = false
    @human_win = false
    @rounds = 0
    game_engine
  end

  def game_check
    player_array = []
    ai_array = []
    ai_board.ship_locations.each {|ship|
    ai_array << ship.occupied_spaces.values.count(true)}
    player_board.ship_locations.each {|ship|
    player_array << ship.occupied_spaces.values.count(true)}
    if player_array.reduce(:+) == 5
      @endgame = true
      @ai_win = true
    elsif ai_array.reduce(:+) == 5
      @endgame = true
      @human_win = true
    end
  end

  def game_engine
    start_game_with_ai_message
    ship_selecting
    Responses.finished_up_ship_placement
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
      player_enter_ship(gets.chomp.downcase)
    elsif !player_ship_input.empty?
      player_board.setup_human_board_with_ship(input)
    end
  end

  def firing_engine
    @x = Time.now
    loop do
      ai_board.draw_grid
      puts 'take a shot!'
      player_fire_missile
      game_check
      break if @endgame == true
      ai_board.draw_grid
      prompt_player
      puts '==========================================='
      puts "the computer retaliates!"
      ai_fire
      game_check
      break if @endgame == true
      player_board.draw_grid
      puts '==========================================='
    end
    @y = Time.now
    endgame
  end

  def endgame
    time = (@y - @x).to_i.divmod 60
    if @human_win
      puts "Congratulations! You beat the hunt for the Red October in #{rounds} rounds! This took #{time[0]} minutes and #{time[1]} seconds"
    else
      puts "Sorry, computer wins! You played #{rounds} rounds which took #{time[0]} minutes and #{time[1]} seconds"
    end
    puts "would you like to (p)lay again or (q)uit?"
    replay(gets.chomp.delete(' ').downcase)
  end

  def replay(input)
    if input[0] == 'p'
      game_engine
    elsif input[0] == 'q'
      'thanks for playing!'
      abort
    else
      puts "that's not a valid response"
    end
  end

  def players_board
    player_board = Board.new(:human)
    player_board.ship_locations.count
  end

  def prompt_player
    puts "press enter to continue"
    enter = gets.chomp
  end

  def player_fire_missile
    validate_player_shot(gets.chomp.downcase)
  end

  def validate_player_shot(missile_guess)
    invalid_chars = [*('e'..'z'), '0',*('5'..'9')]
    nums = [*('1'..'4')]
    if missile_guess.include?(' ')
      puts 'no spaces!'
      player_fire_missile
    elsif missile_guess[0] == "q"
      puts "see you later alligator!"
      abort
    elsif invalid_chars.any? {|char| missile_guess.include?(char)}
      puts 'not a valid character matey!'
      player_fire_missile
    elsif player_missile_guesses.include?(missile_guess)
      puts 'you already shot there!'
      player_fire_missile
    elsif missile_guess.delete(' ').length != 2
      puts "you didn't enter the right amount of characters!"
      player_fire_missile
    elsif !nums.any? {|char| missile_guess.include?(char)}
      puts "you need to enter a number!"
      player_fire_missile
    else
      @rounds += 1
      puts ai_board.is_a_hit?(missile_guess)
    end
  end

  def ai_random_missile

  end

  def ai_fire
    temp_ai_missile = ""
    temp_ai_missile << ['a','b','c','d'].sample
    temp_ai_missile << ['1','2','3','4'].sample
    if !ai_missile.include?(temp_ai_missile)
      ai_missile << temp_ai_missile
    else
      ai_fire
    end
    puts player_board.is_a_hit?(ai_missile[-1])
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
