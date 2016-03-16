# Given an array of integers and a target integer n, return TRUE if there are 3 numbers that can be added to equal n

require 'set'

def three_sum(arr, target)
  diffs = {}

  arr.each_with_index do |num, idx|
    diffs[target - num] ||= []
    diffs[target - num] << idx
  end

  (arr.count - 1).times do |idx1|
    (idx1 + 1...arr.count).each do |idx2|
      two_sum = arr[idx1] + arr[idx2]
      return true if diffs[two_sum] &&
                     !diffs[two_sum].to_set.intersect?([idx1, idx2].to_set)
    end
  end
  false
end

# Tests

puts three_sum([1, 2, 3, 4, 5], 6)
puts three_sum([1, 2, 3, 4, 5], 2)
