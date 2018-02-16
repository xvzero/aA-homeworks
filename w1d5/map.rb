class Map
  attr_accessor :map

  def initialize
    @map = []
  end

  def assign(key, value)
    key_exists = false
    map.each_with_index do |pair, index|
      if pair.first == key
        map[index][1] = value
        key_exists = true
        break
      end
    end

    map << [key, value] unless key_exists
    map
  end

  def lookup(key)
    map.each do |entry, value|
      return value if entry == key
    end
    nil
  end

  def remove(key)
    key_exists = false
    map.each_index do |index|
      if map[index].first == key
        map.delete(map[index])
        key_exists = true
        break
      end
    end

    return nil unless key_exists
    map
  end

  def show
    map
  end
end
