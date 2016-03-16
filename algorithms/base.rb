# given a number, convert it to excel column names
# 1 - > A, 25 -> Y, 27 -> AA 676-> ZZ 677 AAA

def base_two(num)
  result = ''

  until num.zero?
    rem = num % 2
    num /= 2
    result += rem.to_s
  end

  result.reverse
end

def base_excel(num)
  result = ''
  nums = (0..25).to_a
  letters = ('A'..'Z').to_a
  base_map = Hash[nums.zip(letters)]

  until num.zero?
    rem = (num - 1) % 26
    num = (num - 1) / 26
    result += base_map[rem]
  end

  result.reverse
end

# Tests

print base_excel(26)
