# Given an array of integers and an integer n, return TRUE if a pair of numbers can be added to equal n

def two_sum(arr, target)
  counts = Hash.new(0)

  arr.each { |num| counts[num] += 1 }

  arr.each do |num|
    diff = target - num
    if diff == num
      return true if counts[diff] >= 2
    else
      return true if counts[diff] != 0
    end
  end

  false
end

# Tests

puts two_sum([3, 2, 1, 4], 3)
puts two_sum([1, 2, 3, 4], 1)
