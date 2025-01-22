require 'date'

class BinarySearchTree
  include Enumerable

  class Node
    attr_accessor :student, :left, :right

    def initialize(student)
      @student = student
      @left = nil
      @right = nil
    end
  end

  def initialize
    @root = nil
  end

  # Добавление студента в дерево
  def add(student)
    @root = add_rec(@root, student)
  end

  def add_rec(node, student)
    return Node.new(student) if node.nil?

    if student.birth_date < node.student.birth_date
      node.left = add_rec(node.left, student)
    else
      node.right = add_rec(node.right, student)
    end
    node
  end

  # Реализация each для модуля Enumerable (обход in-order)
  def each(&block)
    in_order_traversal(@root, &block)
  end

  private def in_order_traversal(node, &block)
    return if node.nil?

    in_order_traversal(node.left, &block)
    block.call(node.student)
    in_order_traversal(node.right, &block)
  end
end
