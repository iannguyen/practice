# Doubly Linked List
class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil, nxt = nil, prv = nil)
    @key = key
    @val = val
    @next = nxt
    @prev = prv
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class LinkedList
  include Enumerable
  attr_reader :head, :tail

  def initialize
    @head = Link.new(:head, :link)
    @tail = Link.new(:tail, :link)
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    empty? ? nil : @head.next
  end

  def last
    empty? ? nil : @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each { |link| return link.val if link.key == key }
  end

  def include?(key)
    any? { |link| link.key == key }
  end

  def insert(key, val)
    each { |link| return link.val = val if link.key == key }
    new_link = Link.new(key, val, @tail, @tail.prev)
    @tail.prev.next = new_link
    @tail.prev = new_link
    new_link
  end

  def remove(key)
    each do |link|
      next unless link.key == key
      link.prev.next = link.next
      link.next.prev = link.prev
      link.prev = nil
      link.next = nil
      return link.val
    end
  end

  def each
    current_link = @head.next
    until current_link == @tail
      yield current_link
      current_link = current_link.next
    end
  end

  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(', ')
  end
end
