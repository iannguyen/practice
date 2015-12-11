# scratch
def productify(arr)
  result = []

  cum = 1
  arr.each_with_index do |el, idx|
    result[idx] = cum
    cum *= el
  end

  accum = 1
  (arr.length-1).downto(0).each do |j|
    result[j] *= accum
    accum *= arr[j]
  end

  result
end
