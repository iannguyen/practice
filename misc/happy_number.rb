# Write an algorithm to determine if a number is "happy".
#
# A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.
#
# Example: 19 is a happy number
#
# 12 + 92 = 82
# 82 + 22 = 68
# 62 + 82 = 100
# 12 + 02 + 02 = 1

def is_happy(n)
  seen = {}
  until n == 1
    n = sqrd_digit_sum(n)
    return false if seen[n]
    seen[n] = true
  end
  true
end

def sqrd_digit_sum(n)
  sum = 0
  n.to_s.split('').map(&:to_i).each do |i|
    sum += i * i
  end
  sum
end

p is_happy(19)
p is_happy(18)
