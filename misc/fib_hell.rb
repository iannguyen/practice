# Given a sequence of numbers, determine how many possible letter combinations can be made

def string_forms(num)
  num_str = num.to_s
  pairs = []
  pairs_count = 0
  num_str.each_char.with_index do |digit, idx|
    next if idx.zero?
    pair = num_str[idx - 1] + digit
    if (num_str[idx + 1] && num_str[idx + 1].to_i.zero?) ||
       pair.include?('0') ||
       pair.to_i > 26
      pairs << pairs_count if pairs_count > 0
      pairs_count = 0
    else
      pairs_count += 1
    end
  end
  pairs << pairs_count if pairs_count > 0
  pairs.map! { |n| fib(n) }.inject(:*)
end

def fib(num)
  return 1 if num.zero?
  return 2 if num == 1
  prev = 1
  cur = 2
  fib = nil
  (num - 1).times do
    fib = prev + cur
    prev = cur
    cur = fib
  end
  fib
end

p string_forms(123_422)
p string_forms(12_301)
