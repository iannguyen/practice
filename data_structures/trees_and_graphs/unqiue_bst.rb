# Find the number of unique BSTs you can form given n elements

def num_trees(n,cache = Hash.new)
    return 1 if n < 2
    return cache[n] if(cache[n])
    count = 0

    (1..n).each do |root|
        left_tree_num = num_trees(root-1, cache)
        right_tree_num = num_trees(n-root, cache)
        count += left_tree_num*right_tree_num
    end
    cache[n] = count
    count
end

(0..10).each do |num|
    p num_trees(num)
end
