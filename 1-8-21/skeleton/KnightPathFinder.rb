require_relative "lib/00_tree_node.rb"

class KnightPathFinder

    def initialize(pos)
        @start_pos = pos
        @considered_positions = [pos]
        @considered_nodes = [PolyTreeNode.new(pos)]
    end

    attr_accessor :considered_positions, :start_pos, :considered_nodes

    def build_move_tree
        #self.root_note? Why is this required if it is required?
        root_node = PolyTreeNode.new(self.start_pos)
        queue = Array.new.push(root_node.value)
        queue.each do |pos|
            new_moves = new_move_positions(pos)
            new_moves.each do |new_move|
                queue << new_move
            end
        end    

    end

    def valid_moves(pos)
        valid_moves = Array.new
        possible_moves = [[1,2], [2,1], [2,-1], [-2, 1], [-1,-2], [-2,-1], [-2, 1], [-1,2]]
        possible_moves.each do |move|
            pos_move = Array.new
            pos_move << x = pos[0] + move[0]
            pos_move << y = pos[1] + move[1]
            if pos_move[0].between?(0,7) && pos_move[1].between?(0,7)
                valid_moves << pos_move
            end
        end
        valid_moves
    end

    def new_move_positions(pos)
        valid_moves = valid_moves(pos)
        new_moves = Array.new
        if self.considered_nodes.length == 1
            parent_node = self.considered_nodes[0]
        else
            considered_nodes.each do |node|
                if node.value == pos
                    parent_node = node
                end
            end
        end
        valid_moves.each do |move|
            if !self.considered_positions.include?(move)
                self.considered_positions << move
                new_node = PolyTreeNode.new(move)
                new_node.parent = parent_node
                #p new_node
                self.considered_nodes << new_node
                new_moves << move
            end
        end
        new_moves
    end

    def find_path(end_pos)
        end_node = ""
        self.considered_nodes.each do |node|
            if node.value == end_pos
                end_node = node
            end
        end
        trace_path_back(end_node)
    end

    def trace_path_back(node)
        end_pos = node.value
        parent_nil = false
        path = Array.new
        while parent_nil == false
            #p node.parent
            path.unshift(node.parent.value)
            node = node.parent
            if node.parent == nil
                parent_nil = true
            end
        end
        path << end_pos
    end

end

test = KnightPathFinder.new([0,0])

#test.new_move_positions([0,0])

test.build_move_tree


=begin
test.considered_nodes.each do |node|
    p node
end
=end

p test.find_path([6,2])