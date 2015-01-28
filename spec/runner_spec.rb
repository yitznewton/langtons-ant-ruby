require 'spec_helper'
require 'runner'

class RunnerFake
  attr_reader :called

  def initialize
    @board = self
    @called = []
    @moves_done = 0
  end

  def move!
    log(__method__)
    @moves_done += 1
  end

  def off_the_grid?
    log(__method__)
    @moves_done > 1
  end

  def redraw
    log(__method__)
  end

  private

  def log(name)
    called.push(name)
  end
end

describe Runner do
  it 'does the expected actions in order' do
    fake = RunnerFake.new
    runner = Runner.new(output: fake, board: fake)
    runner.start

    expect(fake.called).to eq([
      :off_the_grid?,
      :redraw,
      :move!,
      :off_the_grid?,
      :redraw,
      :move!,
      :off_the_grid?
    ])
  end
end
