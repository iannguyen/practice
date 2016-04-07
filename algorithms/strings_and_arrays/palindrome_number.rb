# Given a number, determine whether the number is a palindrome. Do this without extra space.

def palindrome(num)
  return false if num < 0
  return true if num < 10
  left = 0
  until left >= num
    left = left * 10 + num % 10
    num /= 10
  end
  left == num || left / 10 == num
end
# Tests

p palindrome(123)
p palindrome(10)
p palindrome(1001)
