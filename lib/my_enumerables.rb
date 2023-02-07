module Enumerable
  # Your code goes here
  def my_each_with_index
    if block_given?
      i = 0
      for el in self
        yield el, i
        i += 1
      end
    end

    return self
  end

  def my_select
    arr = []
    for el in self
      result = yield el
      arr << el if result
    end

    arr
  end

  def my_all?
    condition = true
    for el in self
      result = yield el
      
      unless result
        condition = false
        break
      end
    end

    condition
  end

  def my_any?
    condition = false

    for el in self
      result = yield el

      if result
        condition = true
        break
      end
    end

    condition
  end

  def my_none?
    condition = true

    for el in self
      result = yield el

      if result
        condition = false
        break
      end
    end

    condition
  end

  def my_count
    num = 0
    if block_given?
      for el in self
        num += 1 if yield el
      end

      return num
    else
      return self.count
    end
  end

  def my_map
    results = []

    for el in self
      results << yield(el)
    end

    results
  end

  def my_inject(initial_value = 0)
    sum = initial_value

    for el in self
      sum = yield( sum, el)
    end

    sum
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    if block_given?
      for _el in self
        yield _el
      end
    end

    return self
  end
end
