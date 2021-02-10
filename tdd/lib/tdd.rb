def remove_dups(arr)
    unique_hash = Hash.new(0)
    unique_arr = Array.new
    arr.each do |ele|
       unique_hash[ele] += 1
    end
    unique_hash.each do |key, value|
        unique_arr << key
    end
    unique_arr
end

def two_sum(arr)
    zero_sum_arr = Array.new
    arr.each_with_index do |ele1, i|
        arr.each_with_index do |ele2, j|
            if i < j
                if ele1 + ele2 == 0
                    zero_sum_arr << [i,j]
                end
            end
        end
    end
    zero_sum_arr
end

def my_transpose(arr)
    transposed_arr = Array.new(arr.length) { Array.new }
    last_ele_transposed = 0
    while last_ele_transposed < arr.length
        arr.each do |roc|
            transposed_arr[last_ele_transposed] << roc[last_ele_transposed]
        end
        last_ele_transposed += 1
    end
    transposed_arr
end

def stock_picker(arr)
    biggest_difference = 0
    buy_sell_arr = Array.new
    arr.each_with_index do |ele1, i|
        arr.each_with_index do |ele2, j|
            if i < j
                if ele1 > ele2
                    if (ele1 - ele2) > biggest_difference
                        biggest_difference = ele1 - ele2
                        buy_sell_arr = [i,j]
                    end
                end
                if ele2 > ele1
                    if (ele2 - ele1) > biggest_difference
                        biggest_difference = ele2 - ele1
                        buy_sell_arr = [i,j]
                    end
                end
            end
        end
    end
    buy_sell_arr
end

class Hanoi
    attr_reader :board, :won_position
    def initialize()
        @board = Array.new(3) { Array.new }
        self.board[0] = [1,2,3]
        p @won_position = [self.board[2],self.board[1],self.board[0]]
    end

    def move(a,b)
        move = self.board[a].shift
        if self.board[b][0] != nil && self.board[a][0] != nil
            if self.board[a][0] > self.board[b][0]
                p 'You cannot place a larger disk on top of a smaller one!'
                raise ArgumentError 
            elsif self.board[a] == nil
                p "please choose a peg that has disks!"
                raise ArgumentError
            else
                self.board[b].unshift(move)
            end
        else
            self.board[b].unshift(move)
        end
    end

    def won()
        if self.board == self.won_position
            return true
        end
    end

end

game = Hanoi.new
game.move(0,2)
game.move(0,1)
game.move(2,1)
game.move(0,2)
game.move(1,0)
game.move(1,2)
game.move(0,2)

p game.board
