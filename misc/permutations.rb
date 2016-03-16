# Write a function that returns all the possible permutations of an array

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
