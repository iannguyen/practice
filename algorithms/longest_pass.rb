# Return the longest substring in given a string that contains at least one capital letter and no digits

# Return -1 if none

def longest_pass(str)
  longest = nil
  current = ''
  seen_upper = false

  str.each_char.with_index do |x, idx|
    next if x.to_i.to_s == x
    seen_upper = true if x.casecmp(x).zero?
    current << x
    str[idx + 1..str.length].each_char do |y|
      break if y.to_i.to_s == y
      seen_upper = true if y.casecmp(y).zero?
      current << y
    end
    if longest.nil? || current.length > longest.length
      longest = current if seen_upper
    end
    current = ''
    seen_upper = false
  end
  longest && longest.length > 0 ? longest : -1
end

print longest_pass('a00')
