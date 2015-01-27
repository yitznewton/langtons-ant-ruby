require 'spec_helper'
require 'direction'
require 'position'
require 'board'

describe Board do
  subject { Board.new(size, starting_position) }

  context 'with zero size' do
    let(:size) { 0 }
    let(:starting_position) { Position.new(0, 0) }

    it 'rejects it' do
      expect { subject }.to raise_error(RangeError)
    end
  end

  context 'with negative size' do
    let(:size) { -1 }
    let(:starting_position) { Position.new(0, 0) }

    it 'rejects it' do
      expect { subject }.to raise_error(RangeError)
    end
  end

  context 'with positive size' do
    let(:size) { 5 }
    let(:starting_position) { Position.new(2, 2) }

    it 'starts with all white cells' do
      (0...size).each do |row|
        (0...size).each do |col|
          expect(subject.grid[row][col]).to eq(:white)
        end
      end
    end

    it 'shows starting ant position' do
      expect(subject.ant_position.x).to eq(2)
      expect(subject.ant_position.y).to eq(2)
      expect(subject.ant_direction).to eq(:north)
    end

    context 'at the edge of the board' do
      let(:size) { 1 }
      let(:starting_position) { Position.new(0, 0) }

      it 'raises' do
        expect { subject.move! }.to raise_error(RangeError)
      end
    end

    context 'when moving' do
      before do
        subject.move!
      end

      it 'advances the ant' do
        expect(subject.ant_position.x).to eq(3)
        expect(subject.ant_position.y).to eq(2)
        expect(subject.ant_direction).to eq(:east)
      end

      context 'twice' do
        before do
          subject.move!
        end

        it 'advances the ant' do
          expect(subject.ant_position.x).to eq(3)
          expect(subject.ant_position.y).to eq(1)
          expect(subject.ant_direction).to eq(:south)
        end
      end
    end
  end
end
