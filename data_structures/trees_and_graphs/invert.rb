# Definition for a binary tree node.

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def invert_tree(root)
  return unless root
  root.left, root.right = root.right, root.left

  invert_tree(root.left) if root.left
  invert_tree(root.right) if root.right

  root
end

# Tests

root = TreeNode.new(3)
root.left = TreeNode.new(1)
root.right = TreeNode.new(2)

p invert_tree(root)
