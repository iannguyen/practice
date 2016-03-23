# Given 2 sorted linked lists, merge them together and return a new linked list

def merge_two_lists(l1, l2)
  merged = ListNode.new(0)
  current = merged
  while l1 && l2
    if l1.val < l2.val
      new_node = ListNode.new(l1.val)
      l1 = l1.next
    else
      new_node = ListNode.new(l2.val)
      l2 = l2.next
    end
    current.next = new_node
    current = current.next
  end
  rem = l1.nil? ? l2 : l1
  while rem
    current.next = ListNode.new(rem.val)
    rem = rem.next
    current = current.next
  end
  merged.next
end
