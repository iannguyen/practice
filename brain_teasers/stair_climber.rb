# Given n number of stairs, you are allowed to take 1 or 2 steps at a time. Find the number of distinct ways you can get to the top.

def climb_stairs(n)
  return n if n < 4
  prev = 2
  current = 3

  (n - 3).times do
    old_current = current
    current = prev + current
    prev = old_current
  end
  current
end

# Tests

p climb_stairs(2)
p climb_stairs(4)
p climb_stairs(8)
