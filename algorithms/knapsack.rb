# A thief has a bag with n maximum weight. He can steal as many items as he can carry. Each item has varying values. Find the maximum value he can steal.

class Item
  attr_accessor :value, :weight
  def initialize(value, weight)
    @value = value
    @weight = weight
  end
end

def knapsack(weight, arr)
  values = [0]
  last_item = [0]
  sack = []

  (1..weight).each do |w|
    arr.each do |item|
      break if item.weight > w
      rem_weight = w - item.weight

      if values[rem_weight].nil?
        values[rem_weight] = 0
        last_item[rem_weight] = 0
      end

      current = values[rem_weight] + item.value

      next if values[w] && current < values[w]

      values[w] = current
      last_item[w] = item
    end
  end

  until weight.zero? || values[weight].zero?
    sack << last_item[weight]
    weight -= last_item[weight].weight
  end

  sack
end

item1 = Item.new(3, 2)
item2 = Item.new(7, 3)
item3 = Item.new(2, 4)
item4 = Item.new(9, 5)

p knapsack(5, [item1, item2, item3, item4])
