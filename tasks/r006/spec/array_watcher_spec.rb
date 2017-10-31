require 'spec_helper.rb'
require './array_watcher.rb'

describe ArrayWatcher do
    it "should initialize with an array" do
        watcher = ArrayWatcher.new([1, 2, 3])
        expect(watcher).to be_truthy
    end

    it "should initialize with a counter variable as 0" do
        watcher = ArrayWatcher.new([1, 2, 3])
        expect(watcher.counter).to eq 0
    end

    it "should return length" do
        watcher = ArrayWatcher.new([1, 2, 3])
        expect(watcher.length).to eq 3
    end

    it "should return index with []" do
        watcher = ArrayWatcher.new([1, 2, 3])
        expect(watcher[0]).to eq 1
    end

    it "should assign an index with []=" do
        watcher = ArrayWatcher.new([1, 2, 3])
        watcher[0] = 6
        expect(watcher[0]).to eq 6
    end

    it "should increment counter each time it assigns a value to an index" do
        watcher = ArrayWatcher.new([1, 2, 3])
        watcher[0] = 6
        watcher[2] = 5
        watcher[1] = 4
        watcher[0] = 8
        expect(watcher.counter).to eq 4
    end
end
