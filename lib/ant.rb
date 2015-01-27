class Ant
  attr_reader :direction
  attr_reader :x
  attr_reader :y

  DIRECTIONS = {
    north: { i: 0, x:  0, y:  1 },
    east:  { i: 1, x:  1, y:  0 },
    south: { i: 2, x:  0, y: -1 },
    west:  { i: 3, x: -1, y:  0 }
  }

  def initialize(direction, starting_x, starting_y)
    @direction = direction
    @x = starting_x
    @y = starting_y
  end

  def move!(color)
    update_direction!(color)
    @x += DIRECTIONS[@direction][:x]
    @y += DIRECTIONS[@direction][:y]
    self
  end

  private

  def update_direction!(color)
    di = DIRECTIONS[@direction][:i]
    di = (di + color_value(color)) % 4
    @direction = DIRECTIONS.select { |_k, v| v[:i] == di }.keys.first
  end

  def color_value(color)
    color == :black ? -1 : 1
  end
end
