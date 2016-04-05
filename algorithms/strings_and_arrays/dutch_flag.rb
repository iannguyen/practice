# Given an array of 0s, 1s, and 2s, return an array with the 0s in the front and the 2s in the back of the array. O(1) space.

def dutch_flag(arr)
  zeros = 0
  twos = arr.count - 1
  idx = 1

  while idx < twos + 1
    idx += 1 if idx == zeros
    if arr[idx] == 0
      arr[zeros], arr[idx] = arr[idx], arr[zeros]
      zeros += 1
    elsif arr[idx] == 2
      arr[idx], arr[twos] = arr[twos], arr[idx]
      twos -= 1
    else
      idx += 1
    end
  end
  arr
end

# Tests

arr1 = [1, 0, 1, 0, 2, 1, 0, 1, 2, 2].shuffle!

p dutch_flag(arr1) == arr1.sort
