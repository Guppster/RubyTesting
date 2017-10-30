require 'spec_helper.rb'
require './heap_sort.rb'

describe HeapSort do
    it "should sort a simple array" do
        expect(HeapSort.new([3, 2, 1]).heap_sort).to eq [1, 2, 3]
    end

    it "should sort a large array" do
        array = [13577,
                 29359,
                 23121,
                 6879,
                 26388,
                 21234,
                 28665,
                 23647,
                 2115]

        expect(HeapSort.new(array).heap_sort).to eq array.sort!

    end

    it "should sort a duplicat array" do
        expect(HeapSort.new([3, 3, 2, 7, 7, 8, 9, 1]).heap_sort).to eq [1, 2, 3, 3, 7, 7, 8, 9]
    end
end
