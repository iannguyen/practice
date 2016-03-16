# one select a pivot
# two, once we have a pivot, we want to find all items which are greater than the pivot
# everytime we find an element that is greater, we swap with the the second pointer

class Array
  def quicksort(i = 0, j = length - 1)
    return if i >= j

    pivot = self[i]

    idx1 = i
    idx2 = j
    while idx1 < idx2 && idx2 > 0 && idx1 < length
      el1 = self[idx1]

      while el1 <= pivot && idx1 < length
        idx1 += 1
        el1 = self[idx1]
      end

      el2 = self[idx2]
      while el2 > pivot && idx2 > 0
        idx2 -= 1
        el2 = self[idx2]
      end

      self[idx1], self[idx2] = self[idx2], self[idx1] if el1 < el2

      idx1 += 1
      idx2 -= 1
    end

    mid = (idx1 + idx2) / 2

    self[i], self[mid] = self[mid], self[i]

    quicksort(i, mid)
    quicksort(mid + 1, j)
  end
end

arr = [2, 1, 4, 6, 2, 3, 5, 7]
arr.quicksort
p arr
