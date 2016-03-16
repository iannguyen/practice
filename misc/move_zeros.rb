# Move zeros to the end of the array, and keep the relative order. O(1) space.

def move_zeros(arr)
  i = 0
  j = 0

  while j < arr.count
    if arr[j] != 0
      arr[i], arr[j] = arr[j], arr[i]
      i += 1
    end
    j += 1
  end
  arr
end

# Tests

p move_zeros([0, 1, 0, 3, 12, 0])
