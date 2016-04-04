# WRite a function that returns the first n rows of pascal's triangle

def generate(num_rows)
  triangle(num_rows)
end

def factorial(n)
  (1..n).inject(:*)
end

def binomial(n, k)
  return 1 if n - k <= 0
  return 1 if k <= 0
  factorial(n) / (factorial(k) * factorial(n - k))
end

def row(nth_line)
  (0..nth_line).map { |el| binomial(nth_line, el) }
end

def triangle(num_rows)
  result = []
  (0..num_rows - 1).each { |row| result << row(row) }
  result
end

# Tests

p generate(5)
