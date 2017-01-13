require 'pry-byebug'

class BST
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
  end

  def insert(new_data, node = self)
    case true
    when new_data < node.data && node.left == nil
      node.left = BST.new(new_data)
    when new_data > node.data && node.right == nil
      node.right = BST.new(new_data)
    when new_data < node.data
      self.insert(new_data, node.left)
    when new_data > node.data
      self.insert(new_data, node.right)
    else
      node.left = BST.new(new_data)
    end
  end

  def each(&block)
    left.each(&block) if left
    block.call(data)
    right.each(&block) if right
  end

end
