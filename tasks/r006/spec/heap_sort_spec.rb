require 'spec_helper.rb'
require './heap_sort.rb'

describe HeapSort do
    it "should sort a simple array" do
        expect(HeapSort.new([3, 2, 1]).heap_sort).to eq [1, 2, 3]
    end
end
