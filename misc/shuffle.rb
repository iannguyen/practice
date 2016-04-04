# Write a function that shuffles an array

def shuffle(arr)
  new_arr = arr.dup

  new_arr.each_index do |idx|
    rand_idx = idx + rand(new_arr.count - idx)
    new_arr[idx], new_arr[rand_idx] = new_arr[rand_idx], new_arr[idx]
  end

  new_arr
end

# Tests

p shuffle([1, 2, 3, 4, 5])
