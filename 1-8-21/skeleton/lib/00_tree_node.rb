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
            p "Please enter a parent value other than nil!"
        end
    end
end