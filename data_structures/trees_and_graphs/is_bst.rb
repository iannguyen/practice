# Write a method that determines if a tree is a binary search tree

require_relative 'binary_search_tree'

def bst?(node)
  return true if node.nil? || node.left.nil? && node.right.nil?
  return false if !node.left.nil? && node.left.value < node.value
  return false if !node.right.nil? && node.right.value < node.value

  bst?(node.right) && bst?(node.left)
end
