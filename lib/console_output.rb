class ConsoleOutput
  WHITE = "\u2B1C"
  BLACK = "\u2B1B"

  def initialize(board)
    @board = board
  end

  def redraw
    clear_screen
    print_title
    print_board
    puts
  end

  private

  attr_reader :board

  def clear_screen
    print "\033[2J\033[;H"
  end

  def print_title
    puts "LANGTON'S ANT: A RUBY KATA, BY @YitzOfTheBits"
    puts
  end

  def print_board
    (0...grid.length).each do |x|
      (0...grid.length).each do |y|
        print_line(x, y)
      end
      puts
    end
  end

  def print_line(x, y)
    if ant_is_on?(x, y)
      print_ant(board.ant)
    else
      print_cell(grid[x][y])
    end
  end

  def ant_is_on?(x, y)
    [x, y] == [board.ant.x, board.ant.y]
  end

  def grid
    board.grid
  end

  def print_cell(color)
    print color == :white ? WHITE : BLACK
  end

  def print_ant(ant)
    print case ant.direction
          when :north
            "\u2191"
          when :east
            "\u2192"
          when :south
            "\u2193"
          when :west
            "\u2190"
          end
  end
end
