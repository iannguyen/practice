# A number is ugly when its prime factors only include 2,3,5. Given a number n, determine whether the number is ugly or not.

# i.e, 6, 8 are ugly, but 14, is not because 7 is prime and divides 14 evenly

def is_ugly(num)
  return false if num.zero?
  [2, 3, 5].each do |i|
    num /= i while num % i == 0
  end
  num == 1
end

# Tests

p is_ugly(6)
p is_ugly(8)
p is_ugly(14)
p is_ugly(21)
p is_ugly(44)
