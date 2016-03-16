# Given an array of stock prices, find return the 2 days (indices) where the maximum profit is attainable
# O(n) time, O(1) memory

def stock_picker(arr)
  min = nil
  max = nil
  best_profit = nil

  arr.each_with_index do |el, idx|
    min = { val: el, day: idx } if min.nil? || el < min[:val]
    max = { val: el, day: idx } if max.nil? ||
                                   el > max[:val] ||
                                   min[:day] > max[:day]

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

# Cleaner solution

# def stock_picker(prices)
#     min = prices[0];
#     profit = 0;
#     prices.each do |price|
#         min = price if(price < min)
#         profit = price - min if(profit < price - min)
#     end
#     profit
# end

# Tests

stocks1 = [10, 5, 20, 30, 15, 20, 12]
stocks2 = [7, 3, 10, 14, 5, 20, 6]
stocks3 = [1, 2]

puts stock_picker(stocks1)
puts stock_picker(stocks2)
puts stock_picker(stocks3)
puts stock_picker([4, 1, 2])

# Follow up: find the max amount of profit you can make if you can buy and sell infinitely, but can only buy and sell one at a time.

def max_stock_picker(arr)
  profit = 0

  (1...arr.count).each do |idx|
    sum = arr[idx] - arr[idx - 1]
    profit += sum if sum > 0
  end

  profit
end

# Tests

puts max_stock_picker(stocks1)
puts max_stock_picker(stocks2)
puts max_stock_picker(stocks3)
