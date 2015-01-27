class Position
  attr_reader :x
  attr_reader :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def move(dx, dy)
    self.class.new(@x + dx, @y + dy)
  end

  def ==(other)
    @x == other.x && @y == other.y
  end
end
