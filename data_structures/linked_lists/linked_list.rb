# Create a Singly Linked List class

class Link
  attr_accessor :value, :next

  def initialize(v = nil, n = nil)
    @value = v
    @next = n
  end
end

class LinkedList
  attr_accessor :head

  def initialize
    @head = Link.new
  end

  def insert(v)
    current = @head
    current = current.next until current.next.nil?
    current.next = Link.new(v)
  end
end
