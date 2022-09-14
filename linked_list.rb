class Node
  attr_accessor :data, :next

  def initialize(data = nil, next_node = nil)
      @data = data
      @next = next_node
  end

  def value
    @data
  end
end

class List
  attr_accessor :head, :tail

  def initialize( head = nil, tail = nil)
    @head = head
    @tail = tail
  end

  def append(data)
    return @head = Node.new(data) if @head.nil?

    current_node = @head
    new_node = Node.new(data)
    while current_node.next != nil
        current_node = current_node.next
    end
    current_node.next = new_node
    @tail = new_node
  end

  def prepend(data)
    return @head = Node.new(data) if @head.nil?

    new_node = Node.new(data)
    old_tree = @head
    @head = new_node
    @head.next = old_tree
  end

  def size
    return 0 if @head.nil?
    size = 1
    current_node = @head
    while current_node.next != nil
      size += 1
      current_node = current_node.next
    end
    size
  end

  def at(index)
    return 'Error, index not available!' if @head.nil? 

    counter = 0
    current_node = @head
    while counter < index
      counter += 1
      current_node = current_node.next
    end
    current_node
  end

  def pop
    return 'Error, list is already empty!' if @head.nil?
    return @head = nil if @head.next.nil? 

    current_node = @head
    while current_node.next.next != nil
      current_node = current_node.next
    end
    @tail = current_node
    @tail.next = nil
  end

  def contains?(value)
    return 'Error, list is empty!' if @head.nil? 

    does_it = false
    current_node = @head
    while current_node.next != nil
      if current_node.value == value
        does_it = true
      end
      current_node = current_node.next
    end
    current_node.value == value ? true : does_it
  end
  
  def find(value)
    current_index = 0
    current_node = @head
    while current_node.next != nil
      if current_node.value == value
        break
      end
      current_index += 1
      current_node = current_node.next
    end
    current_node.value == value ? current_index : nil
  end

  def to_s
    current_node = @head
    template = ''
    while current_node.next != nil
      template += "(#{current_node.value}) -> " 
      current_node = current_node.next
    end
    template += "(#{current_node.value}) -> " 
    template += 'nil'
  end

end

list = List.new()
list.append('1')
list.append('2')

# p list.find('2')
p list.to_s