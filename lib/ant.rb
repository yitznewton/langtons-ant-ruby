class Ant
  attr_reader :direction
  attr_reader :x
  attr_reader :y

  CLOCKWISE_DIRECTIONS = [:north, :east, :south, :west]

  Struct.new('Delta', :x, :y)

  DELTAS = {
    north: Struct::Delta.new(0,  1),
    east:  Struct::Delta.new(1,  0),
    south: Struct::Delta.new(0, -1),
    west:  Struct::Delta.new(-1, 0)
  }

  def initialize(direction, starting_x, starting_y)
    @direction = direction
    @x = starting_x
    @y = starting_y
  end

  def move!(color)
    update_direction!(color)
    apply_delta!
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
    color == :white ? CLOCKWISE_DIRECTIONS : CLOCKWISE_DIRECTIONS.reverse
  end

  def apply_delta!
    @x += DELTAS.fetch(direction).x
    @y += DELTAS.fetch(direction).y
  end
end
