# Given an integer n, find the number of trailing zeros in n!

def trailing_zeros(n)
  return 0 if n.zero?
  count = 0
  until n.zero?
    n /= 5
    count += n
  end
  count
end

# 10 is a product of 2 * 5
# There will always be more factors of 2 than 5, so count the number of 5 factors in n

# Tests

p trailing_zeros(20)
