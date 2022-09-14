class Node
  include Comparable

  attr_accessor :data, :left, :right

   def <=>(other_node)
      @data.length <=> other_node.data.length
   end

  def initialize(data = nil, left = nil, right = nil)
      @data = data
      @left = left
      @right = right
  end

end

class Tree
  attr_accessor :root

  def initialize(array = [])
    sorted = array.sort.uniq
    @root = build_tree(sorted)
  end

  def build_tree(array)
    return array[0] if array.length < 1
    start = 0
    finish = array.length - 1
    middle = array.length / 2
    tree_root = Node.new(array[middle])
    tree_root.left = build_tree( array.slice(start, middle) )
    tree_root.right = build_tree( array.slice(middle+1, array.length) )
    tree_root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def search(val, root = @root)
    return false if root.nil?

    return root if root.data == val 

    if root.data < val
      return search(val, root.right)
    else
      return search(val, root.left)
    end
  end

  def min_value_node(node)
    current = node
    # loop down to find the leftmost leaf
    unless(current.left.nil?)
      current = current.left
    end
    current
  end

  def insert(val, root = @root)
    return Node.new(val) if root.nil?

    if root.data == val
      return root
    elsif root.data < val
      root.right = insert(val, root.right)
    else
      root.left = insert(val, root.left)
    end
    root
  end

  def delete_node(value, root = @root)
    return root if root.nil?

    if value < root.data
      root.left = delete_node(value, root.left)
    elsif value > root.data
      root.right = delete_node(value, root.right)
    else
      if root.left.nil?
        temp = root.right
        root = nil
        return temp
      elsif root.right.nil?
        temp = root.left
        root = nil
        return temp
      end
      temp = min_value_node(root.right)
      root.data = temp.data
      root.right = delete_node(temp.data, root.right)
    end
    root
  end

  #find
  #level_order
  #inorder
  #preorder
  #postorder
  #height
  #depth
  #balanced?
  #rebalance

end

arr = [1, 2, 3, 6, 923, 2, 8, 4, -5, 33, 5, -10, 30]

tree = Tree.new(arr)

# tree.pretty_print
tree.insert(7)
tree.pretty_print
tree.delete_node(6)
tree.pretty_print
p tree.search(4)