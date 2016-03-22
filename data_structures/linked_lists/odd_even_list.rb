# Given a head node of a linked list, group the odd number nodes followed by the even number nodes in O(n) time and O(1) space. Odd and even refer to the positions, not the values of the nodes

def odd_even_list(head)
  return unless head
  odd = head
  even_head = even
  even = head.next
  while even && even.next
    odd.next = odd.next.next
    even.next = even.next.next
    odd = odd.next
    even = even.next
  end
  odd.next = even_head
  head
end

# Tests

p odd_even_list
p odd_even_list
p odd_even_list
