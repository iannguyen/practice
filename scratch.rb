# scratch

require 'byebug'

def roman_to_int(s)
    mapping = {
        'I': 1,
        'V': 5,
        'X': 10,
        'L': 50,
        'C': 100,
        'D': 500,
        'M': 1000
    }

    num = 0
    s.each_char do |ltr|
      debugger
        num += mapping[ltr]
    end
    num
end

p roman_to_int("DCXXI")
