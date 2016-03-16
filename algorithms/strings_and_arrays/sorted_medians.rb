# Given two sorted arrays, find the median element amongst the two arrays. That is, if both arrays were combined, find the median element from the combined array. Assume that there is not enough memory to actually combine both arrays. There exists an O(log n + log m) solution.

def sorted_medians(arr1, arr2)

  med1 = median(arr1)
  med2 = median(arr2)

  return med1 if med1 == med2

end

def median(arr)
  mid = arr.count / 2

  (arr.count % 2).zero? ? (arr[mid] + arr[mid + 1]) / 2 : arr[mid]
end
