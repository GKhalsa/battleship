class Board
  attr_reader :grid
  def initialize
    @grid = {A:[" "," "," "," "], B:[" "," "," "," "], C:[" "," "," "," "], D:[" "," "," "," "] }
    @ship_locations = 0
  end

  def draw_grid
    grid.each do |key, spaces|
      spaces.join(" ")
    end
  end

  def add_ship(ship)
  end

  def what_ships?
  end

  def validate_ship
  end

end
