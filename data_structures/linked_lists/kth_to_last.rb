# Given a singly linked list and an integer k, return the kth to last node

require_relative 'linked_list'

class LinkedList
  def kth_to_last(k)
    fast = head
    slow = head

    k.times { fast = fast.next }

    until fast.next.nil?
      fast = fast.next
      slow = slow.next
    end

    slow
  end
end

# Tests

ll = LinkedList.new

ll.insert(1)
ll.insert(2)
ll.insert(3)
ll.insert(4)
ll.insert(5)

puts ll.kth_to_last(2).value
