# Function that returns the nth fibonacci number in O(n) time, O(1) memory

def fibonacci(n)
  return 0 if n.zero? || n == 1
  return 1 if n == 2

  first = 0
  second = 1
  fib = nil

  (n - 2).times do
    fib = first + second
    first = second
    second = fib
  end

  fib
end
