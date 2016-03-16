# Write a merge sort function.

def merge_sort(arr)
  return arr if arr.count <= 1

  mid = arr.count / 2

  left = arr.take(mid)
  right = arr.drop(mid)

  merge(merge_sort(left), merge_sort(right))
end

def merge(arr1, arr2)
  merged = []

  until arr1.empty? || arr2.empty?
    case arr1.first <=> arr2.first
    when -1
      merged << arr1.shift
    when 0
      merged << arr1.shift
      merged << arr2.shift
    when 1
      merged << arr2.shift
    end
  end

  merged.concat(arr1).concat(arr2)
end

# Tests

def random_array(n)
  result = []
  n.times do
    result << rand(100)
  end
  result
end

arr = random_array(10)
print merge_sort(arr).to_s + "\n"
