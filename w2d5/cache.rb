class LRUCache
  attr_reader :cache, :max_size

  def initialize(size)
    @cache = []
    @max_size = size
  end

  def count
    # returns number of elements currently in cache
    cache.count
  end

  def add(el)
    # adds element to cache according to LRU principle
    if cache.include?(el)
      cache.delete(el)
    elsif cache.count == max_size
      cache.shift
    end

    cache << el
  end

  def show
    # shows the items in the cache, with the LRU item first
    p cache
    nil
  end
end
