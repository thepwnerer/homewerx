require "tdd"

describe "#remove_dups" do
    it "remove the duplicate values from an array" do
        expect(remove_dups([1,2,1,2,3,3])).to eq([1,2,3])
    end
end

describe "#two_sum" do
    it "finds the positions where the elements sum to zero" do
        expect(two_sum([-1, 0, 2, -2, 1])).to eq([[0, 4], [2, 3]])
    end
end

describe "#my_transpose" do
    it "flips the columns and rows on a two dimensional array" do
        expect(my_transpose([[0, 1, 2],[3, 4, 5],[6, 7, 8]])).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end
end

describe "#stock_picker" do
    it "takes an array of stock prices and then outputs the most profitable pair of days on which to first buy the stock and then sell it" do
        expect(stock_picker([0,5,2,4,7,9,20123,2])).to eq([0,6])
    end
end

describe Hanoi do
    subject(:game) { Hanoi.new() }

    describe "#initialize" do
        it "creates the beginning of the Hanoi game with three disks" do
            expect(game.board).to eq([[1,2,3],[],[]])
        end
    end

    describe "#move" do
        it "moves the top disk of one peg to another peg" do
            game.move(0,1)
            expect(game.board).to eq([[2,3],[1],[]])
        end

        it "returns ArgumentError if the disk being moved is moving on top of a smaller disk" do
            game.move(0,1)
            expect { game.move(0,1) }.to raise_error(ArgumentError)
        end
    end

    describe "#won" do
        subject(:game) { Hanoi.new() }
        it "lets you know that the game has been won when the board is in a won position" do
            game.move(0,2)
            game.move(0,1)
            game.move(2,1)
            game.move(0,2)
            game.move(1,0)
            game.move(1,2)
            game.move(0,2)
            expect(game.won).to eq(true)
        end
    end
end