# Given a sorted array, remove the duplicates in place such that each element appear only once and return the new length.
#
# Do not allocate extra space for another array, you must do this in place with constant memory.
#
# For example,
# Given input array nums = [1,1,2],
#
# Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively. It doesn't matter what you leave beyond the new length.

def remove_duplicates(nums)
  return 0 if nums.empty?
  cur = nums.first
  primary = 1
  nums.each_with_index do |num, _idx|
    next if num == cur
    nums[primary] = num
    cur = num
    primary += 1
  end
  primary
end

# Tests

p remove_duplicates([1, 1, 2])
p remove_duplicates([1, 1, 2, 3, 3, 3, 4, 5, 5])
