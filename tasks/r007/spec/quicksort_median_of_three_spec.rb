require 'spec_helper'

describe Sort do
  subject { Sort }

  describe  "choose_pivot" do
    let(:input) {[3,6,2,3,9,7]}
    let(:output) {subject.choose_pivot(input, 0, input.length - 1)}

    it "choose pivot element" do
      expect(output).to eq 0
    end
  end

  describe  "choose_pivot" do
    let(:input) {[1,-6,-1, -1, -5]}
    let(:output) {subject.choose_pivot(input, 1, input.length - 1)}

    it "choose pivot element" do
      expect(output).to eq 4
    end
  end

  describe("partition") do
    let(:input) { [3, 6, 2, 3, 9, 7] }
    let(:output) { subject.partition(input, 0, input.length - 1) }

    it "partition around the pivot.return index of the pivot element" do
      expect(output).to eq 2
    end
  end

  describe("insersorting") do
    let(:input) { [3, 6, 2, 3, 9, 7] }
    let(:output) { subject.insertion_sort(input, 0, input.length - 1) }

    it "sort" do
      expect(output).to eq [2,3,3,6,7,9]
    end
  end

  describe  "quicksort" do
    let(:input) {[3,6,2,3,9,7]}
    let(:output) {subject.quicksort(input, 0, input.length - 1)}

    it "sort of array" do
      expect(output).to eq [2,3,3,6,7,9]
    end
  end

  describe  "quicksort" do
    let(:input) {[3,6,2,3,9,6,2,3,9,6,2,3,9,6,2,3,9,6,2,3,9,6,2,3,9,6,2,3,9,6,2,3,9,7]}
    let(:output) {subject.quicksort(input, 0, input.length - 1)}

    it "sort of array" do
      expect(output).to eq [2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 6, 6, 6, 6, 6, 6, 6, 6, 7, 9, 9, 9, 9, 9, 9, 9, 9]

    end
  end
end
