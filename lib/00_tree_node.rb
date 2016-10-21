require 'byebug'
class PolyTreeNode
  attr_reader :parent, :value, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    unless self.parent.nil?
      old_parent = self.parent
    end

    unless old_parent == node
      @parent = node
      node.children << self   unless node.nil? ||  node.children.include?(self)
      # debugger unless old_parent.nil?
      unless old_parent.nil?
        old_parent.children.delete(self)
      end
    end

  end







end
