# Swap nodes in pairs and return new head
# i.e. 1 -> 2 -> 3 -> 4
# 2 -> 1 -> 4 -> 3

def swap_pairs(head)
  return head unless head && head.next
  cur = head
  new_head = cur.next
  prev = nil
  while cur && cur.next
    adj = cur.next
    prev.next = adj if prev
    tre = adj.next
    adj.next = cur
    cur.next = tre
    prev = cur
    cur = tre
  end
  new_head
end
