class Queue
    def initialize(arr)
      @queue = arr
    end

    attr_accessor :queue

    def enqueue(el)
      self.queue.unshift(el)
    end

    def dequeue
      self.queue.pop
    end

    def peek
      self.queue[-1]
    end
end

dingle_berry = Queue.new([1, 2, 3, 4])

p dingle_berry.queue

dingle_berry.enqueue(5)

p dingle_berry.queue

dingle_berry.dequeue

p dingle_berry.queue

p dingle_berry.peek