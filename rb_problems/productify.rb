# Given arr, replace each element with the product of all of the other elements without using division in O(n)

def productify(arr)
  result = []

  cumulative = 1
  arr.each_with_index do |el, idx|
    result[idx] = cumulative
    cumulative *= el
  end

  accum = 1
  (arr.length - 1).downto(0).each do |j|
    result[j] *= accum
    accum *= arr[j]
  end

  result
end
