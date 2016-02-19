require_relative 'board.rb'
require_relative 'responses.rb'
require_relative 'endgame.rb'

class Gameplay
  attr_reader :rounds, :ai_board, :player_board, :player_ship_input, :player_missile_guesses, :ai_missile, :endgame, :human_win, :rounds

  def initialize
    @ai_board               = Board.new(:ai)
    @player_board           = Board.new(:human)
    @player_ship_input      = []
    @player_missile_guesses = []
    @ai_missile             = []
    @finale                 = false
    @ai_win                 = false
    @human_win              = false
    @rounds                 = 0
    @endgame                = Endgame.new
    game_engine
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
      if input.delete(' ').chars.uniq.count > 3
        puts "You trickster, I'm onto you, try again"
        ship_selecting
      else
        enter_ship(input)
      end
    elsif !player_ship_input.empty?
      if input.delete(' ').chars.uniq.count > 4
        puts "huh, think you could get away with that? try again"
        ship_selecting
      else
        player_board.setup_human_board_with_ship(input, "Destroyer")
      end
    end
  end

  def enter_ship(input)
    @player_ship_input << input.split
    player_board.setup_human_board_with_ship(input, "uBoat")
    Responses.second_ship
    player_enter_ship(gets.chomp.downcase)
  end

  def firing_engine
    start = Time.now
    loop do
      ai_board.draw_grid
      puts 'take a shot!'
      player_fire_missile
      game_check
      break if @finale == true
      ai_board.draw_grid
      prompt_player
      puts '==========================================='
      puts "the computer retaliates!"
      ai_fire
      game_check
      break if @finale == true
      player_board.draw_grid
      puts '==========================================='
    end
    finish = Time.now
    endgame.final_message(start, finish, human_win, rounds)
  end

  def prompt_player
    puts "press ENTER to continue"
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

  def ai_fire
    temp_ai_missile = ""
    temp_ai_missile << ['a','b','c','d'].sample
    temp_ai_missile << ['1','2','3','4'].sample
    if !ai_missile.include?(temp_ai_missile)
      ai_missile << temp_ai_missile[-2..-1]
    else
      ai_fire = []
      ai_fire
    end
    puts player_board.is_a_hit?(ai_missile[-1])
  end

  def game_check
    player_array = []
    ai_array = []
    ai_board.ship_locations.each {|ship|
    ai_array << ship.occupied_spaces.values.count(true)}
    player_board.ship_locations.each {|ship|
    player_array << ship.occupied_spaces.values.count(true)}
    game_check_adjust(player_array, ai_array)
  end

  def game_check_adjust(player_array, ai_array)
    if player_array.reduce(:+) == 5
      @finale = true
      @ai_win = true
    elsif ai_array.reduce(:+) == 5
      @finale = true
      @human_win = true
    end
  end

end
