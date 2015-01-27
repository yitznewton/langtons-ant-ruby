class Board
  attr_reader :grid
  attr_reader :ant_position

  def initialize(size, starting_position)
    fail RangeError if size <= 0
    @grid = empty_grid(size)
    @ant_position = starting_position
    @ant_direction = Direction.north
  end

  def ant_direction
    @ant_direction.direction
  end

  def move!
    update_direction!
    flip_color!
    advance!
  end

  private

  def update_direction!
    @ant_direction.update!(current_color)
  end

  def flip_color!
    (current_color == :white) ? :black : :white
  end

  def advance!
    @ant_position = @ant_position.move(*@ant_direction.delta)
    fail RangeError if off_the_board
  end

  def off_the_board
    @ant_position.x < 0 || @ant_position.x >= size ||
      @ant_position.y < 0 || @ant_position.y >= size
  end

  def current_color
    grid[@ant_position.x, @ant_position.y]
  end

  def size
    grid.length
  end

  def empty_grid(size)
    Array.new(size, Array.new(size, :white))
  end
end
