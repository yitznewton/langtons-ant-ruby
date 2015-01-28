require 'spec_helper'
require 'game'

class GameFake
  attr_reader :called

  def initialize
    @called = []
    @moves_done = 0
  end

  def move!
    log(__method__, nil)
    @moves_done += 1
  end

  def off_the_board?
    log(__method__, nil)
    @moves_done > 1
  end

  def redraw(_board)
    log(__method__, hash)
  end

  def method_missing(name, *_args)
    log(name, nil)
  end

  private

  def log(name, args)
    called.push([name, args])
  end
end

describe Game do
  it 'does the expected actions in order' do
    fake = GameFake.new
    game = Game.new(output: fake, board: fake)
    game.start

    expect(fake.called).to eq([
      [:off_the_board?, nil],
      [:redraw, fake.hash],
      [:move!, nil],
      [:off_the_board?, nil],
      [:redraw, fake.hash],
      [:move!, nil],
      [:off_the_board?, nil]
    ])
  end
end
