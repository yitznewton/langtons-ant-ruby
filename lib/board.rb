require 'ant'

class Board
  attr_reader :grid
  attr_reader :ant

  def initialize(size, starting_x, starting_y)
    fail RangeError if size <= 0
    @grid = empty_grid(size)
    @ant = Ant.new(:north, starting_x, starting_y)
  end

  def move!
    starting_x, starting_y = @ant.x, @ant.y
    move_ant!
    flip_color(starting_x, starting_y)
  end

  def off_the_grid?
    @ant.x < 0 || @ant.x >= size ||
      @ant.y < 0 || @ant.y >= size
  end

  private

  def move_ant!
    @ant.move!(current_color)
  end

  def flip_color(x, y)
    grid[x][y] = (grid[x][y] == :white) ? :black : :white
  end

  def current_color
    grid[@ant.x][@ant.y]
  end

  def size
    grid.length
  end

  def empty_grid(size)
    Array.new(size) { Array.new(size, :white) }
  end
end
