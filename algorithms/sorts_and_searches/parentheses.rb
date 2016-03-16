# Implement an algorithm to print all valid (e.g., properly opened and closed) combinations of n-pairs of #parentheses. ((())), (()()), (())(), ()(()), ()()()

def print_n(n)
  limit = 2 * n
  stack = [['', 0, 0]]
  res = []
  while stack.length > 0
    p stack
    curr_str, curr_left_count, curr_right_count = stack.pop

    if curr_str.length == limit
      res << curr_str
    else
      curr_count = curr_left_count - curr_right_count
      if curr_left_count < n
        next_left_string = curr_str + '('
        next_left_count = curr_left_count + 1
        stack << [next_left_string, next_left_count, curr_right_count]
      end
      if curr_count > 0
        next_right_string = curr_str + ')'
        next_right_count = curr_right_count + 1
        stack << [next_right_string, curr_left_count, next_right_count]
      end
    end
  end

  res
end

# Tests

p print_n(2)
