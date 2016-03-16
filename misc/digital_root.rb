# Given a non-negative integer, find it's digital root. Repeatedly add the digits until the sum is a single digits

def digital_root(num)
  return 0 if num.zero?

  (num - 1) % 9 + 1
end

# Tests

p digital_root(9)
p digital_root(68)
