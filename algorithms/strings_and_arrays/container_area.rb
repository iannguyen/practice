# Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.

# Note: You may not slant the container.

def max_area(heights)
  best_area = nil

  left = 0
  right = heights.count - 1

  until left >= right
    height = [heights[left], heights[right]].min
    width = right - left
    curr_area = height * width

    best_area = curr_area if best_area.nil? || curr_area > best_area

    break if width == 1

    if heights[left] > heights[right]
      old_right = right
      right -= 1 until heights[right] > heights[old_right] || right - left == 1
    elsif heights[right] > heights[left]
      old_left = left
      left += 1 until heights[left] > heights[old_left] || right - left == 1
    else
      left += 1
      right -= 1
    end
  end

  best_area
end

puts max_area([1, 2, 4, 3])
