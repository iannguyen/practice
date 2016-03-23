def rob(nums)
  sum_a = 0
  sum_b = 0
  nums.each_with_index do |num, idx|
    if idx.even?
      sum_a = max(sum_a + num, sum_b)
    else
      sum_b = max(sum_a, sum_b + num)
    end
  end
  max(sum_a, sum_b)
end

def max(a, b)
  a > b ? a : b
end

# Tests

p rob([2, 1, 1, 2])
p rob([1, 3, 3, 2])
p rob([20, 40, 10, 25, 30])
