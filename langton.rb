$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'board'
require 'console_output'
require 'game'

board = Board.new(60, 25, 25)
output = ConsoleOutput.new
game = Game.new(board: board, output: output)
game.start
