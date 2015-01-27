class Direction
  ALL = {
    north: 0,
    east: 1,
    south: 2,
    west: 3
  }

  def initialize(direction_index)
    @direction_index = direction_index
  end

  def direction
    ALL.invert.fetch(@direction_index)
  end

  def update!(color)
    @direction_index = (@direction_index + color_value(color)) % 4
    self
  end

  def color_value(color)
    color == :black ? -1 : 1
  end

  def self.north
    new(ALL[:north])
  end
end
