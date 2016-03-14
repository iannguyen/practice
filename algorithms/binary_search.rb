# Write a binary search function

def bsearch(arr, target)
  mid = arr.count / 2
  return mid if arr[mid] == target
  return nil if arr.empty?

  case target <=> arr[mid]
  when -1
    bsearch(arr.take(mid), target)
  when 1
    left_search = bsearch(arr.drop(mid + 1), target)
    return left_search if left_search.nil?
    mid + 1 + left_search
  end
end

# Tests

print bsearch([1, 2, 3, 4, 5, 6, 7], 9).to_s + "\n"
print bsearch([1, 2, 3, 4, 5, 6, 7], 0).to_s + "\n"
print bsearch([1, 2, 3, 4, 5, 6, 7], 2).to_s + "\n"
print bsearch([1, 2, 3, 4, 5, 6, 7], 6).to_s + "\n"
print bsearch([1, 2, 3, 4, 5, 6, 7], 4).to_s + "\n"
