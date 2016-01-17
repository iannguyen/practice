require 'byebug'

def make_change(amount, coins)
  coins_count = [0]
  last_coin_array = [0]
  amount = amount.floor
  change = []

  (1..amount).each do |amt|
    coins.each do |coin|
      break if coin > amt

      lower = (amt - coin).floor
      upper = (amt - coin).ceil
      lower_optimal = [coins_count[lower] + 1, coins_count[-1] + 1].min

      if coins_count[upper]
        optimal = [lower_optimal, coins_count[upper] + 1].min
      else
        optimal = lower_optimal
      end

      next if coins_count[amt] && coins_count[amt] < optimal

      coins_count[amt] = optimal

      if !last_coin_array[lower].zero?
        last_coin_array[amt] = last_coin_array[lower]
      else
        last_coin_array[amt] = coin
      end
    end
  end

  until amount <= 0
    change << last_coin_array[amount]
    amount = (amount - last_coin_array[amount]).round
  end

  print 'coin_count:' + "\n" + "#{coins_count}" + "\n" + "\n"
  print 'last_coin_array:' + "\n" + "#{last_coin_array}" + "\n" + "\n"

  print 'change:' + "\n" + "#{change.sort!.reverse!}" + "\n" + "\n"
  print 'total:' + "\n" + "#{change.inject(:+)}" + "\n" + "\n"
end

# print make_change(2, [0.77, 1.23, 4, 5, 9.51, 500])

# def lets_go(n)
#   n.times do |n|
#     make_change(n, [0.77, 1.23, 4, 5, 9.51, 500])
#   end
# end
#
# print lets_go(10000)
