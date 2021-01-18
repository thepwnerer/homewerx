require_relative "lib/00_tree_node.rb"

class KnightPathFinder

    def initialize(pos)
        @start_pos = pos
        @considered_positions = [pos]
    end

    attr_accessor :considered_positions, :start_pos

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
        valid_moves.each do |move|
            if !self.considered_positions.include?(move);
                self.considered_positions << move
                new_moves << move
            end
        end
        new_moves
    end

end

test = KnightPathFinder.new([0,0])

test.build_move_tree

p test.considered_positions