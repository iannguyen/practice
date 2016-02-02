require 'byebug'

class BPTable
  attr_reader :bets, :payouts, :max, :bets_hash, :payouts_hash, :bp_table

  UPPER_CONST = 1.05

  def initialize(bets, payouts)
    @bets = bets
    @payouts = payouts
    @max = payouts.first.round
    @bets_hash = generate_bets_frequency
    @payouts_hash = generate_payouts_frequency
    @bp_table = generate_bp_table!
  end

  def generate_bets_frequency
    hash = {}
    @bets.each do |bet|
      hash[bet] || hash[bet] = []
      hash[bet] << bet
    end
    hash
  end

  def generate_payouts_frequency
    hash = {}
    @payouts.length.times do |id|
      hash[id] = @payouts[id]
    end
    hash
  end

  def generate_bp_table!
    item_count = [0]
    last_items = [0]
    items = @bets_hash.keys.sort

    (1..max).each do |amt|
      items.each do |item|
        if item > amt && item <= (amt * UPPER_CONST)
          item_count[amt] = 1
          last_items[amt] = item
          next
        elsif item > (amt * UPPER_CONST)
          break
        end

        low_rem = (amt - item).floor
        upper_rem = (amt - item).ceil

        if item_count[low_rem].nil?
          item_count[low_rem] = 0
          last_items[low_rem] = 0
        end

        low_rem_optimal = [item_count[low_rem] + 1, item_count[-1] + 1].min

        if item_count[upper_rem]
          optimal = [low_rem_optimal, item_count[upper_rem] + 1].min
        else
          optimal = low_rem_optimal
        end

        next if item_count[amt] && item_count[amt] < optimal

        item_count[amt] = optimal

        if !last_items[low_rem].zero?
          last_items[amt] = last_items[low_rem]
        else
          last_items[amt] = item
        end
      end
    end
    @bp_table = last_items
  end

  def find_optimal(amount)
    payout = []
    until amount <= 0 || @bp_table[amount].nil? || @bp_table[amount].zero?
      payout << @bp_table[amount]
      amount = (amount - @bp_table[amount]).round
    end
    payout.sort!.reverse!
  end

  def cashout(amount)
    success = false
    payment = []
    until success
      optimal = find_optimal(amount)

      if optimal.empty?
        success = true
        break
      else
        optimal.each do |item|
          if !@bets_hash[item].empty?
            payment << @bets_hash[item].pop
            amount -= payment.last.round
            # dynamically adjust the max payout, [remaining_amount, next largest payout]
            debugger
            if @profits[idx + 1]
              @max = [amount, @profits[idx + 1]].max
            else
              @max = amount
            end
            success = true
          else
            @bets_hash.delete(item)
            reset_table!
            success = false
            break
          end
        end
      end
    end
    payment
  end

  def reset_table!
    generate_bp_table!
  end
end

### Tests ###

def random_items(n)
  items = []
  selection = [0.77, 1.23, 4, 5, 9.51, 500]
  n.times do
    items << selection.sample
  end
  items.sort!.reverse!
end

def random_payouts(n)
  payouts = []
  n.times do
    payouts << rand(100)
  end
  payouts.sort!.reverse!
end

def lets_go(n)
  n.times do
    bets = random_items(500)
    payouts = random_payouts(1000)
    random_number = rand(1000)
    payout = BPTable.new(bets, payouts)
    print "random_items: #{bets}" + "\n"
    print "random_payouts: #{payouts}" + "\n"
    print "optimal #{random_number}: #{payout.find_optimal(random_number)}" + "\n"
    print "cashout #{random_number}: #{payout.cashout(random_number)}" + "\n" + "\n"
    print "max: #{payout.max}" + "\n" + "\n"
  end
end

# lets_go(10_000)

bets = random_items(10)
payouts = random_payouts(10)
# selection = [0.77, 1.23, 4, 5, 9.51, 500]
payout = BPTable.new(bets, payouts)
print "payout.bets: #{payout.bets}" + "\n"
# print "random_payouts: #{payouts}" + "\n"
print "optimal #{payouts.max}: #{payout.find_optimal(payouts.max)}" + "\n"
print "cashout #{payouts.max}: #{payout.cashout(payouts.max)}" + "\n" + "\n"
print "max: #{payout.max}" + "\n" + "\n"
