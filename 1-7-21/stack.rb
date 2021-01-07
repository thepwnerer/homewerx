class Stack
    def initialize(arr)
      @stack = arr
    end

    attr_accessor :stack

    def push(el)
      self.stack << el
    end

    def pop
      self.stack.pop()
    end

    def peek
      self.stack[-1]
    end
end

dingle_berry = Stack.new([1, 2, 3, 4])

p dingle_berry.stack

dingle_berry.push(5)

p dingle_berry.stack

dingle_berry.pop

p dingle_berry.stack

p dingle_berry.peek

  