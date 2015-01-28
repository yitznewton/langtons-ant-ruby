$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
require 'board'
require 'console_output'

board = Board.new(5, 2, 2)
output = ConsoleOutput.new(board)
output.redraw
