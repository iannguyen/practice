# Pascal triangle with binomial theorem

def factorial(n)
  (1..n).inject(:*)
end

def binomial(n, k)
  return 1 if n - k <= 0
  return 1 if k <= 0
  factorial(n) / (factorial(k) * factorial(n - k))
end

def triangle(nth_line)
  (0..nth_line).map { |e| binomial(nth_line, e) }
end

# Test

p triangle(1)
