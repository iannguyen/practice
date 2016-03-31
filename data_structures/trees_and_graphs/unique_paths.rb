# Given n*m grid, and only moving right or down, find the number of unique paths you can get to the bottom right, starting from the top left

def uniquePaths(m, n)
  goal = [m - 1, n - 1]
  goal_x, goal_y = goal
  count = 0
  stack = [[0, 0]]
  while stack.any?
    curr_pos = stack.pop
    curr_x, curr_y = curr_pos
    if curr_x == goal_x && curr_y == goal_y
      count += 1
      next
    end
    [[1, 0], [0, 1]].each do |vector|
      vec_x, vec_y = vector
      next_pos = [curr_x + vec_x, curr_y + vec_y]
      stack.push(next_pos) if valid_pos?(next_pos, m, n)
    end
  end
  count
end

def valid_pos?(pos, m, n)
  pos_x, pos_y = pos
  pos_x < m && pos_y < n
end

p uniquePaths(3, 7)
