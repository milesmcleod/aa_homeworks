class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    updated = false
    @map.each do |el|
      if el[0] == key
        el[1] = value
        updated = true
      end
    end
    @map << [key, value] unless updated
  end

  def lookup(key)
    @map.each { |el| return el if el.first == key }
  end

  def remove(key)
    @map.each { |el| @map.delete(el) if el.first == key }
  end

  def show
    @map.dup
  end

end
