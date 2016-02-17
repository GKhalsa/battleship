class Board
  attr_reader :grid
  def initialize
    @grid = {A:[" "," "," "," "], B:[" "," "," "," "], C:[" "," "," "," "], D:[" "," "," "," "] }
    @ship_locations = [["A1", "A2"], ["B2", "B3"]] #maybe objects
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
    @ship_locations << #["b2", "b3"]] #input
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

  def is_a_hit?
    @ship_locations.flatten.include?("B4")

    #if it is included, search ships for "B4" and change ["B4",nil]
    #to ["B4",true]
    # ship1 = {'A1' => nil, 'A2' => nil}
    # ship2 = {'B1' => nil, 'B2' => nil}
    #change @grid[:B][4 - 1] = H   #to_sym
    #else @grid[:B][4 - 1] = M
    #ship_1.map! do |space, peg|
    #  [space, peg = true] if guess == space
    #end
    #ship validator, scans ships for all true

  end

  def show_hit_on_grid
  end

end
