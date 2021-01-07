class Map
    def initialize(arr)
      @map = arr
    end

    attr_accessor :map

    def set(key,value)
        exists = false
        self.map.each_with_index do |arr, i|
            if arr[0] == key
                self.map[i][1] = value
                exists = true
            end
        end
        if exists == false
            self.map << [key, value]
        end
    end

    def get(key)
      self.map.each do |arr|
        if arr[0] == key
           return p arr[1]
        end
      end
    end

    def delete(key)
      self.map.each_with_index do |arr, i|
        if arr[0] == key
            self.map.delete_at(i)
        end
      end
    end

    def show
        self.map.each do |arr|
            p "key: " + arr[0].to_s
            p "value: " + arr[1].to_s
        end
    end
end

dingle_berry = Map.new([[1, "dog"], [2, "cat"], [3, "flying squirrel"]])

dingle_berry.show

dingle_berry.set(1, "angry skunk")

dingle_berry.show

p dingle_berry.get(1)

dingle_berry.delete(1)

dingle_berry.show