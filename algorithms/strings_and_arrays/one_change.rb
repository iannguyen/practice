# Given 2 strings, determine if the strings can be made the same by either:
# - inserting one letter
# - removing one letter
# - swapping 2 letters

def one_change(str1, str2)
  diff = (str1.length - str2.length).abs
  return false if diff > 1

  edits = diff

  shorter = str1.length <= str2.length ? str1 : str2

  shorter.length.times do |i|
    edits += 1 unless str1[i] == str2[i]
    return false if edits > 2
  end

  edits <= 1 ? true : str1.split('').sort == str2.split('').sort
end

# Tests

puts one_change('hello', 'holle')
puts one_change('hello', 'htllb')
puts one_change('hello', 'hellos')
