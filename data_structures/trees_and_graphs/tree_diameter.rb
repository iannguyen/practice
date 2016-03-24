def diameter(node)
  return 0 unless node
  l_height, l_dia = get_diameter(node.left)
  r_height, r_dia = get_diameter(node.right)
  [l_height + r_height - 1, l_dia, r_dia].max
end

def get_diameter(node)
  return [0, 0] unless node
  l_height, l_dia = get_diameter(node.left)
  r_height, r_dia = get_diameter(node.right)
  dia = [l_height + r_height - 1, l_dia, r_dia].max
  height = l_height > r_height ? l_height + 1 : r_height + 1
  [dia, height]
end
