# Given a positive integer represented by an array of integers, add one to the number.

# Digits are stored such that the most significant digit is at the head of the list.

def plus_one(digits)
  cur = digits.count - 1
  while cur >= 0
    digits = add_one(digits, cur)
    break if digits[cur] != 0
    cur -= 1
  end
  digits.first == 0 ? [1] + digits : digits
end

def add_one(digits, idx)
  if digits[idx] == 9
    digits[idx] = 0
  else
    digits[idx] += 1
  end
  digits
end

# Tests

p plus_one([9])
p plus_one([2, 9])
