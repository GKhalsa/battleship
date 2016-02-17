class Board
  attr_reader :grid
  def initialize
    @grid = {A:[" "," "," "," "], B:[" "," "," "," "], C:[" "," "," "," "], D:[" "," "," "," "] }
    @ship_locations = 0
  end

  def draw_grid
    grid.each do |key, spaces|
      key + spaces
    end
  end

end
