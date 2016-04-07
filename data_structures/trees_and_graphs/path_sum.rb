# Given a binary search tree and integer n, determine if there exists a path that from root to left that can equal the sum.

def has_path_sum(root, sum)
  return false if root.nil?
  return true if sum - root.val == 0 && !root.left && !root.right

  has_path_sum(root.left, sum - root.val) || has_path_sum(root.right, sum - root.val)
end
