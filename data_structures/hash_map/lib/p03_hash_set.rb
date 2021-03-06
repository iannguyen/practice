require_relative 'p02_hashing'

# HashSet stores any data type, not just numbers by hashing before inserting
class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { [] }
    @count = 0
  end

  def insert(key)
    resize! if @count + 1 > num_buckets
    self[key] << key
    @count += 1
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    self[key].delete(key)
    @count -= 1
  end

  private

  def [](num)
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old = @store
    @store = Array.new(num_buckets * 2) { [] }
    @count = 0
    old.flatten.each { |el| insert(el) }
  end
end
