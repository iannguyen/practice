class TreeNode
  attr_accessor :left, :right, :val
  def initialize(val)
    @val = val
    @left, @right = nil
  end
end

class BST
  attr_accessor :root
  def initialize(val)
    @root = TreeNode.new(val)
  end

  def insert(val)
    cur = @root
    stop = false
    until stop
      if val < cur.val && cur.left
        cur = cur.left
      elsif val > cur.val && cur.right
        cur = cur.right
      else
        stop = true
      end
    end
    if val < cur.val
      cur.left = TreeNode.new(val)
    else
      cur.right = TreeNode.new(val)
    end
  end
end

def max_height(root, cache)
  # probably use dfs and use recursion on each of child nodes, and terminate once it's a node is nil
  # base case will be if a node is nil, return 0, then probably add 1 to include the parent node
  return 0 unless root

  left_height = max_height(root.left, cache)
  right_height = max_height(root.right, cache)

  cache[root.val] ||= left_height + right_height - 1

  left_height > right_height ? left_height + 1 : right_height + 1
end

# get the heights, add them, store them in the cache
def diameter(root, cache = {})
  return 0 unless root

  max_height(root, cache)

  cache.max_by { |_key, val| val }
end

#  3
# 1 4

# jerk.

bst = BST.new(10)
bst.insert(5)
bst.insert(15)
bst.insert(12)
bst.insert(3)
bst.insert(2)
bst.insert(1)
bst.insert(4)

p diameter(bst.root)
