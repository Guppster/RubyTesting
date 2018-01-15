require 'spec_helper'

describe Sort do
  subject { Sort }

  describe  "choose_pivot" do
    let(:input) {[3,6,2,3,9,7]}
    let(:output) {subject.choose_pivot(input, 0, input.length - 1)}

    it "choose pivot element" do
      expect(output).to eq 3
    end
  end

  describe  "choose center_pivot" do
    let(:input) {[1,2,3,4,5,6]}
    let(:output) {subject.choose_pivot(input, 1, input.length - 1)}

    it "choose pivot element" do
      expect(output).to eq 4
    end
  end

  describe("partition") do
    let(:input) { [3, 6, 2, 3, 9, 7] }
    let(:output) { subject.partition(input, 0, input.length - 1) }

    it 'partition around the pivot.return index of the pivot element' do
      expect(output).to eq 2
    end
  end

  describe 'quicksort' do
    let(:input) {[3,6,2,3,9,7]}
    let(:output) {subject.quicksort(input, 0, input.length - 1)}

    it "sort of array" do
      expect(output).to eq [2,3,3,6,7,9]
    end
  end

  describe 'quicksort negative' do
    let(:input) {[1,-6,-1, -1, -5]}
    let(:output) { subject.quicksort(input, 0, input.length - 1) }

    it 'sort of array' do
    end
  end

  describe 'quicksort same high and low' do
    let(:input) {[1,-6,-1, -1, 1]}
    let(:output) { subject.quicksort(input, 0, input.length - 1) }

    it 'sort of array' do
    end
  end

  describe 'quicksort small' do
    let(:input) {[1,2]}
    let(:output) { subject.quicksort(input, 0, input.length - 1) }

    it 'sort of array' do
    end
  end

  describe 'quicksort small reverse' do
    let(:input) {[2,1]}
    let(:output) { subject.quicksort(input, 0, input.length - 1) }

    it 'sort of array' do
    end
  end

  describe 'quicksort single' do
    let(:input) {[2]}
    let(:output) { subject.quicksort(input, 0, input.length - 1) }

    it 'sort of array' do
    end
  end

  describe 'quicksort big' do
    let(:input) {[3,6,2,3,9,6,2,3,9,6,2,3,9,6,2,3,9,6,2,3,9,6,2,3,9,6,2,3,9,6,2,3,9,7]}
    let(:output) {subject.quicksort(input, 0, input.length - 1)}

    it 'sort of array' do
      expect(output).to eq [2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 6, 6, 6, 6, 6, 6, 6, 6, 7, 9, 9, 9, 9, 9, 9, 9, 9]

    end
  end
end
