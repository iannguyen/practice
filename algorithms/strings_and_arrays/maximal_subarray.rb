# Given an array of positive and negative integers, return the largest sum of a continuous subarray

def max_sub_sum(arr)
  max_sum = nil
  cur_sum = 0

  arr.each_with_index do |num, _idx|
    if num < 0
      max_sum = cur_sum if max_sum.nil? || cur_sum > max_sum
      cur_sum = 0
      next
    end

    cur_sum += num
  end

  max_sum
end

# Tests

puts max_sub_sum([1, 2, 1, -1, 5, -3, 2])
puts max_sub_sum([1, 2, 1, -1, 5, 10, -3, 2])
