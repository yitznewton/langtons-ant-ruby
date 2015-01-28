class Game
  def initialize(params)
    @output = params.fetch(:output)
    @board = params.fetch(:board)
  end

  def start
    until board.off_the_board?
      output.redraw(board)
      board.move!
    end
  end

  private

  attr_reader :output
  attr_reader :board
end
