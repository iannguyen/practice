# Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
#
# You may assume that the array is non-empty and the majority element always exist in the array.

# Bayer-Moore voting algorithm
def majority_element(nums)
  major = nums.first
  count = 0

  nums.each do |num|
    if major == num
      count += 1
    else
      count.zero? ? major = num : count -= 1
    end
  end
  major
end

# Tests

p majority_element([1, 2, 1, 3, 1])
