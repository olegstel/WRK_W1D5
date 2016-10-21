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
      unless old_parent.nil?
        old_parent.children.delete(self)
      end
    end

    def add_child(node)
      node.parent = self

      unless self.children.include?(node)
        self.children << node
      end
    end

    def remove_child(node)
      raise "Not a child " unless self.children.include?(node)
      self.children.delete(node)
      node.parent = nil
    end

    def dfs(target_value)
      return self if self.value == target_value

      self.children.each do |child|
        search_result = child.dfs(target_value)
        return search_result unless search_result.nil?
      end

      nil
    end

    def bfs(target_value)
      nodes =[self]

      until nodes.empty?
        last_node = nodes.pop
        return last_node if last_node.value == target_value
        last_node.children.each { |ch| nodes.unshift(ch) } unless last_node.children.nil?
      end

      nil
    end

  end







end
