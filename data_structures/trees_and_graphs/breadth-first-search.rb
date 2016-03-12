# Write a breadth-first-searc function

def bfs(node)
  queue = [node]

  until queue.empty?
    current = queue.shift
    puts "Passing through #{current.value}"
    queue.concat(current.children) if current.children
  end
end
