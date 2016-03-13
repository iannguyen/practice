# You are given a string, s, and a list of words, words, that are all of the same length. Find all starting indices of substring(s) in s that is a concatenation of each word in words exactly once and without any intervening characters.
#
# For example, given:
# s: "barfoothefoobarman"
# words: ["foo", "bar"]
#
# You should return the indices: [0,9].
# (order does not matter).

def find_substring(s, words)
  words_hash = {}
  words.each { |word| words_hash[word] = true }
  seen_hash = {}
  words_count = words.count
  word_length = words.first.length
  sub_length = words_count * word_length
  result = []
  idx = 0
  
  until idx + sub_length >= s.length
    word = s[idx..idx + word_length - 1]
    if words_hash[word]
      potential = s[idx..idx + sub_length - 1]
      potential_words = potential.each_char.each_slice(word_length).map(&:join)
      potential_words.each do |pword|
        break unless words_hash[pword] && !seen_hash[pword]
        seen_hash[pword] = true
      end
      result << idx if seen_hash.keys.count == words_count
      seen_hash = {}
    end
    idx += 1
  end
  result
end

# Tests

s = 'barfoothefoobarman'
words = %w(foo bar)

print find_substring(s, words).to_s + "\n"
