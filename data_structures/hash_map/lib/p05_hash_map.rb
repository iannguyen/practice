require_relative 'p02_hashing'
require_relative 'p04_linked_list'

# HashSet with Linked List
class HashMap
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    resize! if count + 1 > num_buckets
    bucket(key).insert(key, val)
    @count += 1
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    bucket(key).remove(key)
    @count -= 1
  end

  # same yield parameters as a ruby hash, for to_s
  def each
    @store.each do |bucket|
      bucket.each { |link| yield [link.key, link.val] }
    end
  end

  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k} => #{v}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias [] get
  alias []= set

  private

  def num_buckets
    @store.length
  end

  def resize!
    old = @store
    @store = Array.new(num_buckets * 2) { LinkedList.new }
    @count = 0
    old.each do |bucket|
      bucket.each { |link| set(link.key, link.val) }
    end
  end

  def bucket(key)
    @store[key.hash % num_buckets]
  end
end
