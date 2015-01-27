require 'spec_helper'
require 'board'

describe Board do
  subject { Board.new(size, starting_x, starting_y) }

  context 'with zero size' do
    let(:size) { 0 }
    let(:starting_x) { 0 }
    let(:starting_y) { 0 }

    it 'is rejected' do
      expect { subject }.to raise_error(RangeError)
    end
  end

  context 'with negative size' do
    let(:size) { -1 }
    let(:starting_x) { 0 }
    let(:starting_y) { 0 }

    it 'is rejected' do
      expect { subject }.to raise_error(RangeError)
    end
  end

  context 'with positive size' do
    let(:size) { 5 }
    let(:starting_x) { 2 }
    let(:starting_y) { 2 }

    it 'starts with all white cells' do
      (0...size).each do |x|
        (0...size).each do |y|
          expect(subject.grid[x][y]).to eq(:white)
        end
      end
    end

    it 'delegates ant data' do
      expect(subject.ant.x).to eq(2)
      expect(subject.ant.y).to eq(2)
      expect(subject.ant.direction).to eq(:north)
    end

    context 'moving off the edge of the board' do
      let(:size) { 2 }
      let(:starting_x) { 1 }
      let(:starting_y) { 1 }

      it 'raises' do
        expect { subject.move! }.to raise_error(RangeError)
      end
    end

    context 'when moving' do
      before do
        subject.move!
      end

      it 'advances the ant' do
        expect(subject.ant.x).to eq(3)
        expect(subject.ant.y).to eq(2)
        expect(subject.ant.direction).to eq(:east)
      end

      it 'updates grid color' do
        expect(subject.grid[2][2]).to eq(:black)

        (0...size).each do |x|
          (0...size).each do |y|
            expect(subject.grid[x][y]).to eq(:white) unless [x, y] == [2, 2]
          end
        end
      end
    end

    context 'when moving twice' do
      before do
        subject.move!
        subject.move!
      end

      it 'advances the ant' do
        expect(subject.ant.x).to eq(3)
        expect(subject.ant.y).to eq(1)
        expect(subject.ant.direction).to eq(:south)
      end

      it 'updates grid color' do
        expect(subject.grid[2][2]).to eq(:black)
        expect(subject.grid[3][2]).to eq(:black)

        (0...size).each do |x|
          (0...size).each do |y|
            if [x, y] != [2, 2] && [x, y] != [3, 2]
              expect(subject.grid[x][y]).to eq(:white)
            end
          end
        end
      end
    end
  end
end
