require 'spec_helper'
require 'position'

describe Position do
  subject { Position.new(x, y) }

  let(:x) { 1 }
  let(:y) { 2 }

  it 'calculates new position' do
    expect(subject.move(3, 4)).to eq(Position.new(4, 6))
    expect(subject.move(4, 5)).to eq(Position.new(5, 7))
  end
end
