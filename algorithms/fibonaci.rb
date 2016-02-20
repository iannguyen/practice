# Function that returns the nth fibonacci number with O(n) time, O(1) memory

def fibonacci(n)
  return n if n < 2

  first = 0
  second = 1
  fib = nil

  (n - 1).times do
    fib = first + second
    first = second
    second = fib
  end

  fib
end
