class PolyTreeNode

    def initialize(val)
        @value = val
        @parent = nil
        @children = Array.new
    end

    attr_accessor :value, :children, :parent

    def parent=(p)
        if p != nil
            #unset the old parent's children before putting in new parent if parent is already set
            if @parent != nil
                @parent.children.delete(self)
            end
            #set parent to non-nil value
            @parent = p
            #don't add duplicate children to parent's children
            if !(p.children.include?(self))
                p.children << self
            end
        else
            @parent = nil
        end
    end

    def add_child(child)
       @children << child
       child.parent = self
    end

    def remove_child(child)
        if child && !self.children.include?(child)
            raise "Tried to remove node that isn't a child"
        end
        child.parent = nil
    end

    def dfs(target_value)
        return self if self.value == target_value
        self.children.each do |child|
            result = child.dfs(target_value)
            return result unless result.nil?
        end

        nil
    end
=begin
    def dfs(target = nil, &prc)
        raise "Need a proc or target" if [target, prc].none?
        prc ||= Proc.new { |node| node.value == target }

        return self if prc.call(self)

        children.each do |child|
        result = child.dfs(&prc)
        return result unless result.nil?
        end

        nil
    end
=end

    def bfs(target = nil, &prc)
        raise "Need a proc or target" if [target, prc].none?
        prc ||= Proc.new { |node| node.value == target }

        nodes = [self]
        until nodes.empty?
        node = nodes.shift

        return node if prc.call(node)
        nodes.concat(node.children)
        end

        nil
    end

end