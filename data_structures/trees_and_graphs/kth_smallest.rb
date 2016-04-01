# Find the kth smallest element in a binary search tree.

def kth_smallest(root, k)
  count = count_nodes(root.left)

  return root.val if count + 1 == k

  if count + 1 > k
    kth_smallest(root.left, k)
  else
    kth_smallest(root.right, k - 1 - count)
  end
end

def count_nodes(root)
  return 0 unless root

  count_nodes(root.left) + count_nodes(root.right) + 1
end
