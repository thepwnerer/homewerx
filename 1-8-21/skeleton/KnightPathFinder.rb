require_relative "lib/00_tree_node.rb"

class KnightPathFinder

    def initialize(pos)
        @start_pos = pos
        @considered_positions = [pos]
    end

    def build_move_tree
        #self.root_node = PolyTreeNode.new(start_pos)
    end

    def self.valid_moves(pos)
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
        #@valid_moves(pos)
    end

end

test = KnightPathFinder.new([0,0])

test.new_move_positions([3,3])