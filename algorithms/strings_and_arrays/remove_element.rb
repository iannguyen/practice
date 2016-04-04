# Given an array and a value, remove all instances of that value in place and return the new length.
#
# Do not allocate extra space for another array, you must do this in place with constant memory.
#
# The order of elements can be changed. It doesn't matter what you leave beyond the new length.
#
# Return the index in which after swapping, the beginning of the array to the index will not contain the target val

def remove_element(nums, val)
  count = 0

  nums.each_with_index do |num, _idx|
    next if num == val
    nums[count] = num
    count += 1
  end

  count
end

# Tests

p remove_element([2, 2, 3], 2)
p remove_element([3, 2, 2, 3], 3)
