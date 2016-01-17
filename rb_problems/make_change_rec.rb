def make_change(amount, coins, current = [])
  return [] if amount.zero? || coins.last > amount
  best_change = nil

  coins.each do |coin|
    next if coin > amount

    remaining_amount = amount - coin
    remaining_change = make_change(remaining_amount, coins, current)
    current_change = remaining_change.push(coin)

    if best_change.nil? || current_change.count < best_change.count
      best_change = current_change
    end
  end

  best_change
end
