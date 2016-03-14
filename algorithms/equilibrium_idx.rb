# Equilibrium indices

# Return all indices in which at index i for array of length n, sum(a[0..i-1]) == sum(a[i+1..n])

def equil_idcs(a)
  left = 0
  sum = a.inject(:+)
  equils = []
  a.each_with_index do |num, idx|
    sum -= num
    equils << idx if left == sum
    left += num
  end
  equils.empty? ? -1 : equils
end

# Tests

print equil_idcs([5, 3, 1, 4, 4]).to_s + "\n"
print equil_idcs([5, 1, 0, 2, 3]).to_s + "\n"
