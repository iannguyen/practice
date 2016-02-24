# Implement a stack using 2 queues
class QueueStack
  def initialize
    @popqueue = [] # has push and shift
    @queue = []
  end

  def push(el)
    @queue << @popqueue.shift if @popqueue.count == 1
    @popqueue << el
    to_s
  end

  def pop
    popped = @popqueue.shift
    rotate!
    popped
  end

  def rotate!
    @popqueue << @queue.shift until @queue.empty?
    @queue << @popqueue.shift until @popqueue.count == 1
  end

  def to_s
    @queue + @popqueue
  end
end
