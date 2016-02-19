# Equilibrium indices

# Return all indices in which at index i for array of length n, sum(a[0..i-1]) == sum(a[i+1..n])

def equil_idcs(a)
  cumulative = 0
  sum = a.inject(:+)
  equils = []
  a.each_with_index do |num, idx|
    sum -= num
    equils << idx if cumulative == sum
    cumulative += num
  end
  equils.empty? ? -1 : equils
end

print "#{equil_idcs([1, 2, 1])}" + "\n"
print "#{equil_idcs([0, 1, -1])}" + "\n"
