require 'spec_helper'
require 'direction'

describe Direction do
  it 'has a North factory' do
    expect(described_class.north.direction).to eq(:north)
  end

  context 'from north' do
    subject { described_class.north }

    it 'starts out pointing north' do
      expect(subject.direction).to eq(:north)
    end

    it 'turns right when arriving on white' do
      expect(subject.update!(:white).direction).to eq(:east)
      expect(subject.update!(:white).direction).to eq(:south)
      expect(subject.update!(:white).direction).to eq(:west)
      expect(subject.update!(:white).direction).to eq(:north)
      expect(subject.update!(:white).direction).to eq(:east)
    end

    it 'turns left when arriving on black' do
      expect(subject.update!(:black).direction).to eq(:west)
      expect(subject.update!(:black).direction).to eq(:south)
      expect(subject.update!(:black).direction).to eq(:east)
      expect(subject.update!(:black).direction).to eq(:north)
      expect(subject.update!(:black).direction).to eq(:west)
    end

    it 'returns x-y deltas' do
      expect(subject.delta).to eq([0, 1])
      expect(subject.update!(:white).delta).to eq([1, 0])
      expect(subject.update!(:white).delta).to eq([0, -1])
      expect(subject.update!(:white).delta).to eq([-1, 0])
      expect(subject.update!(:white).delta).to eq([0, 1])
    end
  end
end
