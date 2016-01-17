require 'byebug'

def make_change(amount, coins)
  coins_count = [0]
  last_coin_array = [0]
  amount = amount.floor
  change = []

  (1..amount).each do |amt|
    coins.each do |coin|
      break if coin > amt

      remainder = amt - coin.round
      optimal = [coins_count[remainder] + 1, coins_count[-1] + 1].min
      next if coins_count[amt] && coins_count[amt] < optimal

      coins_count[amt] = optimal

      if !last_coin_array[remainder].zero?
        last_coin_array[amt] = last_coin_array[remainder]
      else
        last_coin_array[amt] = coin
      end
    end
  end

  until amount.floor <= 0
    change << last_coin_array[amount]
    amount -= last_coin_array[amount]
  end

  print "coin_count" + "\n" + "#{coins_count}" + "\n" + "\n"
  print "last_coin_array" + "\n" + "#{last_coin_array}" + "\n" + "\n"

  print "change" + "\n" + "#{change}" + "\n" + "\n"

end

print make_change(55.12, [0.77,1.23,5.2,7.1,9.7,10.11])
