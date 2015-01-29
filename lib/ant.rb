class Ant
  attr_reader :direction
  attr_reader :x
  attr_reader :y

  class CircularArray
    def initialize(array)
      @array = array
    end

    def after(member)
      fetch(index(member) + 1)
    end

    def before(member)
      fetch(index(member) - 1)
    end

    def fetch(i)
      @array.fetch(i % size)
    end

    def index(member)
      @array.index(member)
    end

    def size
      @size ||= @array.size
    end
  end

  CLOCKWISE_DIRECTIONS = CircularArray.new([:north, :east, :south, :west])

  Struct.new('Delta', :x, :y)

  DELTAS = {
    north: Struct::Delta.new(0,  1),
    east:  Struct::Delta.new(1,  0),
    south: Struct::Delta.new(0, -1),
    west:  Struct::Delta.new(-1, 0)
  }

  COLOR_METHODS = {
    black: :before,
    white: :after
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
    CLOCKWISE_DIRECTIONS.send(COLOR_METHODS.fetch(color), @direction)
  end

  def apply_delta!
    @x += DELTAS.fetch(direction).x
    @y += DELTAS.fetch(direction).y
  end
end
