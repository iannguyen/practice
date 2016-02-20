# Given 2 strings, determine if the strings can be made the same by either:
# - inserting one letter
# - removing one letter
# - swapping 2 letters

def one_change(str1, str2)
  diff = (str1.length - str2.length).abs
  return false if diff > 1

  edits = 0

  shorter = str1.length <= str2.length ? str1 : str2

  shorter.length.times do |i|
    edits += 1 unless str1[i] == str2[i]
  end

  if edits.zero? || (edits == 1 && diff == 1) || (edits == 2 && diff == 0)
    true
  else
    false
  end
end
