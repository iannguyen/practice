require_relative 'p05_hash_map'
require_relative 'p04_linked_list'
require 'byebug'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    link = @map[key]
    if link
      update_link!(link)
      link.val
    else
      calc!(key)
    end
  end

  def to_s
    'Map: ' + @map.to_s + "\n" + 'Store: ' + @store.to_s
  end

  private

  # insert uncached key
  def calc!(key)
    val = @prc.call(key)
    link = @store.insert(key, val)
    @map[key] = link
    eject! if count > @max
    val
  end

  # move a link to the end of the list
  def update_link!(link)
    link.prev.next = link.next
    link.next.prev = link.prev
    @store.last.next = link
    link.prev = @store.last
    link.next = @store.tail
    @store.tail.prev = link
  end

  def eject!
    link = @store.first
    @store.head.next = link.next
    @store.first.prev = @store.head
    @map.delete(link.key)
  end
end
