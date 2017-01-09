# Paths with Sum: You are given a binary tree in which each node contains an integer value (which
# might be positive or negative). Design an algorithm to count the number of paths that sum to a
# given value. The path does not need to start or end at the root or a leaf, but it must go downwards
# (traveling only from parent nodes to child nodes).
# Hints: #6, #74, #52, #68, #77, #87, #94, #703, #708, #115


class Node
  attr_accessor :data,:children, :right, :left
  def initialize(data,left, right)
    @data = data
    @right = right
    @left = left
    @children = [right,left]
  end
  def insert(insertNode)
    if @right == nil
      @right = insertNode
    elsif @left == nil
      @left = insertNode
    else
      return false
    end
    true
  end

end

class BinaryTree
  attr_accessor :root
  def initialize(array)
    @root = Node.new(array.shift(),nil,nil)
    createBTree(array,@root)
  end
  def createBTree(array,root)
    notFullLeafs = Array.new()
    a
  end
end

def TestCreateBinaryTree()
  testArray = [1,-1,2,-2,3,-3,4,-4,5,-5,6,-6,7,-7,-8,8,-9,9]
end
