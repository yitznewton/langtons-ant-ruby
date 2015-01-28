class ConsoleOutput
  WHITE = "\u2B1C "
  BLACK = "\u2B1B "

  def redraw(board)
    clear_screen
    print_title
    print_board(board)
    puts
  end

  def clear_screen
    print "\033[2J\033[;H"
  end

  def print_title
    puts "LANGTON'S ANT: A RUBY KATA, BY @YitzOfTheBits"
    puts
  end

  def print_board(board)
    grid = board.grid 

    (0...grid.length).each do |x|
      (0...grid.length).each do |y|
        if [x, y] == [board.ant.x, board.ant.y]
          print_ant(board.ant)
        else
          print_cell(grid[x][y])
        end
      end
      puts
    end
  end

  def print_cell(color)
    print color == :white ? WHITE : BLACK
  end

  def print_ant(ant)
    symbol = case ant.direction
    when :north
      "\u2191"
    when :east
      "\u2192"
    when :south
      "\u2193"
    when :west
      "\u2190"
    end

    print "#{symbol} "
  end
end
