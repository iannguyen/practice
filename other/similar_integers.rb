# Given num, find the number of similar integers. A number is similar when it contains all the same digits

# i.e. 1231 similar to 1312

def similar_nums(num)
  freq = Hash.new(0)
  fact = factorial(num.to_s.length)
  num.to_s.each_char { |ltr| freq[ltr] += 1 }
  freq.values.map(&:to_i).each { |count| fact /= factorial(count) }
  fact
end

def factorial(num)
  prod = 1
  (1..num).each { |f| prod *= f }
  prod
end
