# Write a function that finds the square root of a number, with basic arithmetic functions, in less than O(n) time. (The number will always be a perfect square)

def square_root(num, nums = nil)
  nums ||= (1..num / 2).to_a
  mid_point = nums.count / 2
  mid = nums[mid_point]

  case mid * mid <=> num
  when -1
    square_root(num, nums.drop(mid_point + 1))
  when 0
    return mid
  when 1
    square_root(num, nums.take(mid_point))
  end
end

# Tests

puts square_root(25)
puts square_root(49)
puts square_root(4)
puts square_root(9)
