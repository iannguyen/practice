# Write a function to determine if a Binary Search tree is balanced

require_relative 'binary_search_tree'

def balanced?(node)
  return true if node.nil?

  left_depth = depth(node.left)
  right_depth = depth(node.right)
  diff = (left_depth - right_depth).abs

  balanced?(node.left) && balanced?(node.right) && diff <= 1
end

def depth(node)
  return 0 if node.nil?

  [depth(node.left), depth(node.right)].max + 1
end
