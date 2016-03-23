def level_order_bottom(root)
  return [] unless root
  stack, queue = [], []
  stack << [root.val]
  lvl = 0
  queue << [root, lvl]
  until queue.empty?
    cur = queue.shift
    node = cur.first
    lvl = cur.last
    children = []
    c_lvl = lvl + 1
    [node.left, node.right].each do |child|
      next unless child
      queue << [child, c_lvl]
      children << child.val
    end
    next if children.empty?
    stack[c_lvl] ? stack[c_lvl].concat(children) : stack[c_lvl] = children
  end
  stack.reverse
end
