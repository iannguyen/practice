# Isomorphic Strings

# Helper function

def basal(str)
  basic = []
  ltr_counter = 'a'
  seen = {}

  str.each_char.with_index do |ltr, idx|
    ascii = ltr.chr
    seen[ascii] = ltr_counter if idx.zero?

    if seen[ascii]
      basic << seen[ascii]
    else
      ltr_counter = ltr_counter.next
      seen[ascii] = ltr_counter
      basic << ltr_counter
    end
  end

  basic.join('-')
end

# Part 1
# Determine if 2 strings are isomorphic (each letter has a 1-1 relational mapping)
# i.e. 'asdf' is isomorphic to 'fdsa'

def isomorphic(str1, str2)
  return false if str1.length != str2.length

  seen1 = {}
  seen2 = {}

  str1.each_char.with_index do |ltr, idx|
    if !seen1[ltr] && !seen2[str2[idx]]
      seen1[ltr] = str2[idx]
      seen2[str2[idx]] = true
    else
      return false unless seen1[ltr] == str2[idx]
    end
  end

  true
end

# Part 2
# Given list of strings, determine if all are isomorphic

def iso_list(arr)
  arr.each_with_index do |str, idx|
    adj = arr[idx + 1]
    return false if adj && !isomorphic(str, adj)
  end
  true
end

# Part 3
# Find all isomorphic sets

def iso_sets(arr)
  sets = {}

  arr.each do |str|
    basic = basal(str)
    sets[basic] ||= []
    sets[basic] << str
  end

  sets
end
