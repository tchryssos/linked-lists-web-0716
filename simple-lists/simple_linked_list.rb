class Node
  attr_accessor :data, :next, :prev
  def initialize(data, next_data=nil, prev_data=nil)
    @data=data
    @next=next_data
    @prev=prev_data
  end
end

class LinkedList

  def initialize(data)
    @head=Node.new(data)
  end

  def head
    @head
  end

  def index_at(index)
    node=@head
    index.times do
      if node.next != nil
        node=node.next
      else
        return nil
      end
    end
    return node.data
  end

  def insert_at_index(index, data)
    node=@head
    if index==0
      unshift(data)
    else
      (index-1).times do
        if node.next!=nil
          node=node.next
        else
          push(nil)
          node=node.next
        end
      end
      new_next=node.next
      new_node=Node.new(data, new_next, node)
      node.next=new_node
      if new_next != nil
        new_next.prev=new_node
      end
    end
  end

  def unshift(data)
    node=@head
    @head=Node.new(data, node)
    node.prev=@head
  end

  def push(data)
    node=@head
    until node.next==nil
      node=node.next
    end
    node.next=Node.new(data, nil, node)
  end

end
