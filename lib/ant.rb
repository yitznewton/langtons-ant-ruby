class Ant
  attr_reader :direction
  attr_reader :x
  attr_reader :y

  DIRECTIONS = {
    north: { dx:  0, dy:  1 },
    east:  { dx:  1, dy:  0 },
    south: { dx:  0, dy: -1 },
    west:  { dx: -1, dy:  0 }
  }

  def initialize(direction, starting_x, starting_y)
    @direction = direction
    @x = starting_x
    @y = starting_y
  end

  def move!(color)
    update_direction!(color)
    @x += DIRECTIONS[@direction][:dx]
    @y += DIRECTIONS[@direction][:dy]
  end

  private

  def update_direction!(color)
    @direction = next_direction_for(color)
  end

  def next_direction_for(color)
    ordered_directions = directions_for(color)
    i = (ordered_directions.index(direction) + 1) % 4
    ordered_directions[i]
  end

  def directions_for(color)
    color == :white ? DIRECTIONS.keys : DIRECTIONS.keys.reverse
  end
end
