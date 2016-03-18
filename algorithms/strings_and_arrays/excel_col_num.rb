# Given a column title as appear in an Excel sheet, return its corresponding column number.
#
# For example:
#
#     A -> 1
#     B -> 2
#     C -> 3
#     ...
#     Z -> 26
#     AA -> 27
#     AB -> 28

def title_to_number(str)
  result = 0

  str.each_char do |ltr|
    result = (result * 26) + (ltr.ord - 64)
  end

  result
end

# Tests

p title_to_number('A')
p title_to_number('AA')
p title_to_number('AB')
p title_to_number('BA')
