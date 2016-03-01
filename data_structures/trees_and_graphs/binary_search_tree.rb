# Implement a binary search tree class

class BinarySearchTree
  attr_accessor :root

  def self.from_array(arr, given_node = nil)
    return EmptyNode.new if arr.count.zero?
    arr.uniq! unless given_node
    mid = arr.count / 2
    node = given_node ? Node.new(arr[mid]) : BinarySearchTree.new(arr[mid])
    node.left = BinarySearchTree.from_array(arr.take(mid), node)
    node.right = BinarySearchTree.from_array(arr.drop(mid + 1), node)
    node
  end

  def initialize(v)
    @root = Node.new(v)
  end

  def left=(value)
    @root.left = value
  end

  def right=(value)
    @root.right = value
  end

  def insert(val, node = nil)
    current = node ? node : @root
    case val <=> current.value
    when -1
      p current.left = Node.new(val) if current.left.nil?
      insert(val, current.left)
    when 1
      p current.right = Node.new(val) if current.right.nil?
      insert(val, current.right)
    when 0
      return 'Already included'
    end
  end

  def include?(val, given_node = nil)
    current = given_node ? given_node : @root
    return false if current.nil?
    return true if current.value == val
    val < current.value ? include?(val, current.left) : include?(val, current.right)
  end

  def value
    @root.value
  end
end

class Node
  attr_reader :value
  attr_accessor :left, :right

  def initialize(v)
    @value = v
    @left = EmptyNode.new
    @right = EmptyNode.new
  end

  def inspect
    "#{value}: left: #{left.inspect}, right: #{right.inspect}"
  end
end

class EmptyNode
  def nil?
    true
  end

  def inspect
    '{}'
  end
end

# Tests

arr = %w(5 10 7 3 9 4 1 8 6 2 4 3 3 3 3).map(&:to_i).sort!
bst = BinarySearchTree.from_array(arr)

puts bst.include?(10)
puts bst.include?(3)
puts bst.include?(6)
puts bst.include?(11)

puts bst.insert(11)
puts bst.insert(1)
puts bst.insert(3)
puts bst.insert(15)
