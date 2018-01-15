require 'spec_helper.rb'
require './heap_sort.rb'
require './array_watcher.rb'

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

    it "should run in nlogn" do
        (15...100).each { |counter|
        array = ArrayWatcher.new(counter) { rand(1000) } 

        HeapSort.new(array).heap_sort

        expect(array.counter).to be < counter * sqrt(counter)
        }
    end
end
