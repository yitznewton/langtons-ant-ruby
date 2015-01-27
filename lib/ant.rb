class Ant
  attr_reader :direction
  attr_reader :x
  attr_reader :y

  DIRECTIONS = {
    north: { i: 0, dx:  0, dy:  1 },
    east:  { i: 1, dx:  1, dy:  0 },
    south: { i: 2, dx:  0, dy: -1 },
    west:  { i: 3, dx: -1, dy:  0 }
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
    starting_di = DIRECTIONS[@direction][:i]
    new_di = (starting_di + color_delta(color)) % 4
    @direction = DIRECTIONS.select { |_k, v| v[:i] == new_di }.keys.first
  end

  def color_delta(color)
    color == :black ? -1 : 1
  end
end
