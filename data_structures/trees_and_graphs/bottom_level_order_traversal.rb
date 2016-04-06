# Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).

def level_order_bottom(root)
  stack = []
  queue = []
  return stack unless root
  level = 0
  stack << [root.val]
  queue << [root, level]
  until queue.empty?
    cur = queue.shift
    node = cur.first
    level = cur.last
    children = []
    cur_level = level + 1
    [node.left, node.right].each do |child|
      if child
        queue << [child, cur_level]
        children << child.val
      end
    end
    if stack[cur_level]
      stack[cur_level].concat(children) unless children.empty?
    else
      stack[cur_level] = children unless children.empty?
    end
  end
  stack.reverse
end
