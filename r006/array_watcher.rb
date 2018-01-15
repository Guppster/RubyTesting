
# Measures the performance of an array by counting operations
class ArrayWatcher

    attr_reader :counter

    def initialize(array)
        @array = array
        @counter = 0
    end

    def length
        @array.size
    end

    def [](index)
        @counter += 1
        @array[index]
    end

    def []=(index, value)
        @counter += 1
        @array[index] = value
    end
end
