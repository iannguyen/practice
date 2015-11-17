def permutations(arr)
  return [arr] if arr.size == 1
  first = arr.first
  new_perms = []

  perms = permutations(arr.drop(1))
  perms.each do |perm|
    (0..perm.size).each do |i|
      new_perms << perm[0...i] + [first] + perm[i...perm.size]
    end
  end
  new_perms
end



# factorial method
def fact(n)
  (1..n).reduce(:*)
end

# binomial theorem, n choose k
def binomial(n,k)
  return 1 if n-k <= 0
  return 1 if k <= 0
  fact(n) / ( fact(k) * fact( n - k ) )
end

def triangle(nth_line)
  (0..nth_line).map { |e| binomial(nth_line, e) }
end

# print fact(5)
# print "#{binomial(5,0)} "
# print "#{binomial(5,1)} "
# print "#{binomial(5,2)} "
# print "#{binomial(5,3)} "
# print "#{binomial(5,4)} "
# print "#{binomial(5,5)} "
print triangle(3)
# print triangle(5)
