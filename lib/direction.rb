class Direction
  ALL = {
    north: [0, 1],
    east:  [1, 0],
    south: [0, -1],
    west:  [-1, 0]
  }

  def initialize(direction_index)
    @direction_index = direction_index
  end

  def direction
    ALL.keys.fetch(@direction_index)
  end

  def delta
    ALL.values.fetch(@direction_index)
  end

  def update!(color)
    @direction_index = (@direction_index + color_value(color)) % 4
    self
  end

  def color_value(color)
    color == :black ? -1 : 1
  end

  def self.north
    new(ALL.keys.index(:north))
  end
end
