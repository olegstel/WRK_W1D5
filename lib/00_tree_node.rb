class PolyTreeNode
  attr_reader :parent, :value, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)

    #
    @parent = node
    node.children << self   unless node.nil? ||  node.children.include?(self)
  end







end
