# Find the optimal way to make change for a given amount, and coins (least coins and as close as possible to the amount)

def make_change(amount, coins)
  coins_count = [0]
  last_coin_array = [0]
  amount = amount.round
  change = []

  (1..amount).each do |amt|
    coins.each do |coin|
      break if coin > amt

      lower = (amt - coin).floor
      upper = (amt - coin).ceil

      if coins_count[lower].nil?
        coins_count[lower] = 0
        last_coin_array[lower] = 0
      end

      lower_optimal = [coins_count[lower] + 1, coins_count[-1] + 1].min

      optimal = if coins_count[upper]
                  [lower_optimal, coins_count[upper] + 1].min
                else
                  lower_optimal
                end

      next if coins_count[amt] && coins_count[amt] < optimal

      coins_count[amt] = optimal

      last_coin_array[amt] = if !last_coin_array[lower].zero?
                               last_coin_array[lower]
                             else
                               coin
                             end
    end
  end

  until amount <= 0
    change << last_coin_array[amount]
    amount = (amount - last_coin_array[amount]).round
  end

  print 'coin_count:' + "\n" + coins_count.to_s + "\n" + "\n"
  print 'last_coin_array:' + "\n" + last_coin_array.to_s + "\n" + "\n"
  print 'change:' + "\n" + change.sort!.reverse!.to_s + "\n" + "\n"
  print 'total:' + "\n" + change.inject(:+).to_s + "\n" + "\n"
end

print make_change(40, [0.77, 1.23, 4, 5, 9.51, 500])
