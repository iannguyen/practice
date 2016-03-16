# Part 1: Write a function that determines if str1 is a substring of str2

# Part 2: Using the substring method only once, determine if str1 is a rotation of str2. (i.e.) 'foobar' and 'obarfo'

class String
  def rotation?(string)
    return false unless length == string.length
    double = string * 2
    substring?(double)
  end

  def substring?(string)
    return false if length > string.length

    string.each_char.with_index do |ltr, idx|
      next unless ltr == self[0]
      return true if self == string[idx...(idx + length)]
    end
    false
  end
end

# Tests

p 'hello'.rotation?('llohe')
