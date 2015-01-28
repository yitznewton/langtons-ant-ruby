$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'board'
require 'console_output'
require 'runner'

board = Board.new(100, 35, 35)
output = ConsoleOutput.new(board)
runner = Runner.new(board: board, output: output)
runner.start
