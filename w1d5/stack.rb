class Stack
  attr_accessor :stack

  def initialize(stack = [])
    @stack = stack
  end

  def add(el)
    stack.push(el)
  end

  def remove
    stack.pop
  end

  def show
    stack
  end
end
