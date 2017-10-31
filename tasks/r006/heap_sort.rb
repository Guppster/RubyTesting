# Responsible for sorting arrays using the heap sort strategy 
class HeapSort
    attr_reader :input

    def initialize(arg)
        @input = arg
    end

    def heap_sort
        heapify()

        the_end = input.length - 1

        while the_end > 0
            @input[the_end], @input[0] = @input[0], @input[the_end]
            
            the_end -= 1
            shift_down(0, the_end)
        end

        return @input
    end

    def heapify
        length = @input.length

        the_start = (length - 2) / 2

        while the_start >= 0 
            shift_down(the_start, length - 1)
            the_start -= 1
        end
    end

    def shift_down(the_start, the_end)

        while the_start * 2 + 1 <= the_end
            child = the_start * 2 + 1

            swap = prepare_swap(the_start, child)

            return unless swap != the_start

            perform_swap(the_start, swap)

            the_start = swap
        end
    end

    def prepare_swap(swap, child)
            next_child = child + 1

            if @input[swap] < @input[child]
                swap = child
            end

            if next_child <= the_rnd && @input[swap] < @input[next_child]
                swap = next_child
            end
            
            return swap
    end

    def perform_swap(the_start, swap)
            @input[the_start], @input[swap] = @input[swap], @input[the_start]
    end

end
