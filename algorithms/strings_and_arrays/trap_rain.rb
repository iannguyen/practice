# Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.
#
# For example,
# Given [0,1,0,2,1,0,1,3,2,1,2,1], return 6.

def trap_water(heights)
  total = 0
  left = 0
  right = heights.count - 1

  until left >= right
    left_wall = heights[left]
    right_wall = heights[right]
    min_height = left_wall > right_wall ? right_wall : left_wall

    if left_wall <= right_wall
      new_left = left + 1
      until heights[new_left] >= left_wall
        depth = min_height - heights[new_left]
        total += depth
        new_left += 1
      end
      left = new_left
    else
      new_right = right - 1
      until heights[new_right] >= right_wall
        depth = min_height - heights[new_right]
        total += depth
        new_right -= 1
      end
      right = new_right
    end
  end

  total
end

# Tests

p trap_water([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1])
