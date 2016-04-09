# Reverse a singly Linked List

class Node
  attr_accessor :next, :val
  def initialize(val)
    @val = val
    @next = nil
  end
end

def reverse_ll(head)
  return head unless head
  prv = nil
  cur = head
  nxt = cur.next

  while cur && cur.next
    cur.next = prv
    prv = cur
    cur = nxt
    nxt = cur.next
  end

  cur.next = prv
  cur
end

# Tests

a = Node.new(1)
cur = a

(2..5).each do |num|
  cur.next = Node.new(num)
  cur = cur.next
end

p reverse_ll(a)
