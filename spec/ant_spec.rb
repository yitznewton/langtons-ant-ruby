require 'spec_helper'
require 'ant'

describe Ant do
  context 'from north' do
    subject { described_class.new(:north, 50, 50) }

    it 'turns right when arriving on white' do
      subject.move!(:white)
      expect(subject.x).to eq(51)
      expect(subject.y).to eq(50)
      subject.move!(:white)
      expect(subject.x).to eq(51)
      expect(subject.y).to eq(49)
      subject.move!(:white)
      expect(subject.x).to eq(50)
      expect(subject.y).to eq(49)
      subject.move!(:white)
      expect(subject.x).to eq(50)
      expect(subject.y).to eq(50)
    end

    it 'turns left when arriving on black' do
      subject.move!(:black)
      expect(subject.x).to eq(49)
      expect(subject.y).to eq(50)
      subject.move!(:black)
      expect(subject.x).to eq(49)
      expect(subject.y).to eq(49)
      subject.move!(:black)
      expect(subject.x).to eq(50)
      expect(subject.y).to eq(49)
      subject.move!(:black)
      expect(subject.x).to eq(50)
      expect(subject.y).to eq(50)
    end
  end
end
