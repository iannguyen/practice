# Write a depth-first-search function

def dfs(node)
  puts "Passing through #{node.value}"
  node.children.each { |child| dfs(child) }
end
