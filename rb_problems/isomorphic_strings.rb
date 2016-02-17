# Helpers

def basal(str)
  basic = ''
  ltr_counter = 'a'
  seen = {}

  str.each_char.with_index do |ltr, idx|
    seen[ltr] = ltr_counter if idx.zero?

    if seen[ltr]
      basic << seen[ltr]
    else
      ltr_counter = ltr_counter.next
      seen[ltr] = ltr_counter
      basic << ltr_counter
    end
  end

  basic
end

# Part 1
# Determine if 2 strings are isomorphic (each letter has a 1-1 relational mapping)
# i.e. 'asdf' is isomorphic to 'fdsa'

def isomorphic(str1, str2)
  return false if str1.length != str2.length

  hash = {}

  str1.each_char.with_index do |ltr, idx|
    if !hash[ltr]
      hash[ltr] = str2[idx]
    else
      return false unless hash[ltr] == str2[idx]
    end
  end

  true
end

# Part 2
# Given list of strings, determine if all are isomorphic

def iso_list(_arr)
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

puts iso_sets(['asd', 'foo', 'poo', 'bar'])
puts iso_sets(['asdf', 'foof', 'poof', 'bars'])

# puts isomorphic('foo', 'bar')
# puts isomorphic('bar', 'foo')
