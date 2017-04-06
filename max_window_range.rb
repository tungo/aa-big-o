class Stack
  attr_reader :store
  def initialize
    @store = []
  end
  def push(el)
    @store << el
  end
  def pop
    @store.pop
  end
  def empty?
    @store.empty?
  end
  def length
    @store.length
  end
  def peek
    @store.last
  end
end

class MaxMinStack
  attr_reader :store

  def initialize
    @min_store = Stack.new
    @max_store = Stack.new
    @store = Stack.new
  end

  def push(el)
    @store.push(el)
    @min_store.push(el) if @min_store.empty? || el <= @min_store.peek
    @max_store.push(el) if @max_store.empty? || el >= @max_store.peek
  end

  def pop
    removed_el = @store.pop
    @min_store.pop if @min_store.peek == removed_el
    @max_store.pop if @max_store.peek == removed_el
    removed_el
  end

  def empty?
    length == 0
  end

  def length
    @store.length
  end

  def min
    @min_store.peek
  end

  def max
    @max_store.peek
  end

end

class StackQueue
  def initialize
    @in_stack = MaxMinStack.new
    @out_stack = MaxMinStack.new
  end

  def enqueue el
    @in_stack.push(el)
  end

  def dequeue
    if(@out_stack.empty?)
      until(@in_stack.empty?)
        @out_stack.push(@in_stack.pop)
      end
    end
    @out_stack.pop
  end

  def length
    @in_stack.length + @out_stack.length
  end

  def empty?
    length == 0
  end

  def min
    if(!@in_stack.min.nil? && !@out_stack.min.nil?)
      @in_stack.min > @out_stack.min ? @out_stack.min : @in_stack.min
    elsif @in_stack.min.nil? && @out_stack.min.nil?
      nil
    elsif @in_stack.min.nil?
      @out_stack.min
    elsif @out_stack.min.nil?
      @in_stack.min
    end
  end

  def max
    if(!@in_stack.max.nil? && !@out_stack.max.nil?)
      @in_stack.max < @out_stack.max ? @out_stack.max : @in_stack.max
    elsif @in_stack.max.nil? && @out_stack.max.nil?
      nil
    elsif @in_stack.max.nil?
      @out_stack.max
    elsif @out_stack.max.nil?
      @in_stack.max
    end
  end
end

def max_window_range(arr, num)
  max_range = nil

  (0..arr.length - num).each do |idx|
    window = arr[idx...idx + num]
    range = window.max - window.min
    max_range = range if max_range == nil || range > max_range
  end

  max_range
end

def optimized_solution arr, num
  queue = StackQueue.new
  arr[0...num].each {|el| queue.enqueue(el) }

  largest_diff = queue.max - queue.min
  arr[num..-1].each do |el|
    queue.enqueue(el)
    queue.dequeue
    diff = queue.max - queue.min
    largest_diff = diff if diff > largest_diff
  end
  largest_diff
end

p optimized_solution([1, 0,-1], 2)  # 4, 8
p optimized_solution([1, 0, 2, 5, 4, 8], 2) # 4, 8
p optimized_solution([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p optimized_solution([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p optimized_solution([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8s
