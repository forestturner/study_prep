class Node
  attr_accessor :data, :next
  def initialize(d = nil)
    @data = d
    @next = nil
  end

  def appendToTail(int d)
    end_node = Node.new(d)
    temp_node = self
    while(temp_node.next != nil)
      temp_node = temp_node.next
    end
    temp_node.next = end_node
  end

  def deleteNode(head, d)
    temp_node = head
    if (temp_node.data == d)
      return head.next
    end
    while(temp_node != nil)
      if(temp_node.next.data == d)
        temp_node.next = temp_node.next.next
        return head
      end
      temp_node = temp_node.next
    end
    return head 
  end


end
