# Given a sorted Linked List, remove the duplicates

def delete_duplicates(head)
  return unless head
  base = head
  runner = head.next

  until runner.nil?
    if base.val != runner.val
      base.next = runner
      base = runner
      runner = base.next
    else
      runner = runner.next
    end
  end
  base.next = runner
  head
end
