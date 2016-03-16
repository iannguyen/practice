# Return the longest substring in given a string that contains at least one capital letter and no digits

# Return -1 if none

def longest_password(str)
  longest = nil

  words = str.split(/[0-9]/)
  words.each do |word|
    longest = word if password?(word) &&
                      (longest.nil? || longest.length < word.length)
  end

  longest ? longest : -1
end

def password?(str)
  /[A-Z]/ =~ str ? true : false
end
