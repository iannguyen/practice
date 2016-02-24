# Implement a queue with 2 stacks, optimized for O(1) dequeuing
class StackQueue
  def initialize
    @in_stack = [] # has push and pop
    @out_stack = []
  end

  def enqueue(el)
    out_to_in unless @out_stack.empty?
    @in_stack << el
    in_to_out
  end

  def dequeue
    @out_stack.pop
  end

  def in_to_out
    @out_stack << @in_stack.pop until @in_stack.empty?
  end

  def out_to_in
    @in_stack << @out_stack.pop until @out_stack.empty?
  end

  def inspect
    print "@in_stack #{@in_stack} : @out_stack #{@out_stack}}"
  end
end
