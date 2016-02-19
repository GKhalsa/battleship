class Generator

  def initialize
  end

  def two_spot_generation
    spots = ["A1 A2", "A2 A3", "A3 A4", "B1 B2", "B2 B3", "B3 B4",
    "C1 C2", "C2 C3", "C3 C4", "D1 D2", "D2 D3", "D3 D4",
    "A1 B1", "B1 C1", "C1 D1", "A2 B2", "B2 C2", "C2 D2",
    "A3 B3", "B3 C3", "C3 D3", "A4 B4", "B4 C4", "C4 D4"].sample
  end

  def three_spot_generation
    spots = ["A1 A2 A3", "A2 A3 A4", "B1 B2 B3", "B2 B3 B4",
    "C1 C2 C3", "C2 C3 C4", "D1 D2 D3", "D2 D3 D4",
    "A1 B1 C1", "B1 C1 D1", "A2 B2 C2", "B2 C2 D2",
    "A3 B3 C3", "B3 C3 D3", "A4 B4 C4", "B4 C4 D4"].sample
  end

  def valid_positions
    position_one = [] << two_spot_generation.split
    position_two = [] << three_spot_generation.split
    until position_one[0] & position_two[0] == []
      if position_one[0] & position_two != []
        valid_positions
      end
    end
    position_one << position_two
    position_one.flatten
  end

end
