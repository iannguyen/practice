# Given an array of stock prices, find return the 2 days (indices) where the maximum profit is attainable
# O(n) time, O(1) memory

def stock_picker(arr)
  min = nil
  max = nil
  best_profit = nil

  arr.each_with_index do |el, idx|

    min = { val: el, day: idx } if min.nil? || el < min[:val]
    max = { val: el, day: idx } if max.nil? || el > max[:val]

    cur_profit = max[:val] - min[:val] if min[:day] <= max[:day]

    next unless best_profit.nil? ||
                (cur_profit && cur_profit > best_profit[:profit])

    best_profit = {
      profit: cur_profit,
      buy_day: min[:day],
      sell_day: max[:day]
    }
  end

  best_profit
end

# Tests

puts stock_picker([10, 5, 20, 3, 6])
puts stock_picker([1, 2, 20, 3, 50, 1])
