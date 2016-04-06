# Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).

def level_order(root)
  return [] unless root
  stack = []
  queue = []
  level = 0
  queue << [root, level]
  stack[level] = [root.val]
  until queue.empty?
    cur = queue.shift
    node = cur.first
    cur_level = cur.last + 1
    children = []
    [node.left, node.right].each do |child|
      if child
        queue << [child, cur_level]
        children << child.val
      end
    end
    next if children.empty?
    stack[cur_level] ||= []
    stack[cur_level].concat(children)
  end
  stack
end
