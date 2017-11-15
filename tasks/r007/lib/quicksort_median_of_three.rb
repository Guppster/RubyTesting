require "quicksort_median_of_three/version"

class Sort

  def self.quicksort(ar, lo, hi)
    while lo <= hi
      p = partition(ar, lo, hi)
      quicksort(ar, lo, p - 1)
      lo = p + 1
    end

    ar
  end

  def self.partition(ar, lo, hi)
    index = choose_pivot(ar, lo, hi)
    pivot = ar.fetch(index)

    ar[index], ar[hi] = ar[hi], ar[index]

    i = lo - 1

    (lo...hi).each do |j|
      if ar.fetch(j) <= pivot
        i += 1
        ar[i], ar[j] = ar[j], ar[i]
      end
    end

    i += 1
    ar[i], ar[hi] = ar[hi], ar[i]

    i
  end

  def self.choose_pivot(ar, left, right)
    center = (left + right) / 2

    return left if (ar.fetch(left) - ar.fetch(right)) * (ar.fetch(center) - ar.fetch(left)) >= 0

    return right if (ar.fetch(right) - ar.fetch(left)) * (ar.fetch(center) - ar.fetch(right)) >= 0

    center
  end
end
