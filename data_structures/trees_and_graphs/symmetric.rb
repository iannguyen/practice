# Write a function to determine if a binary tree is symmetric

def symmetric?(root)
  return true unless root
  symmetric(root.left, root.right)
end

def symmetric(left, right)
  return left == right if left.nil? || right.nil?
  return false unless left.val == right.val
  symmetric(left.right, right.left) && symmetric(left.left, right.right)
end
