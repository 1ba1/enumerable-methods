# module Enumerable
module Enumerable
  def my_each
    for item in self
      yield(item)
    end
    return self if block_given?
  end

  def my_each_with_index
    count = 0
    self.my_each do |item|
      yield(item, count)
      count += 1
    end
    return self if block_given?
  end

  def my_select
    array = []
    self.my_each do |item|
      array.push(item) if yield(item) == true
    end
    return array if block_given?
  end

  def my_all?
    count = 0
    self.my_each do |item|
      count += 1 if yield(item) == true
    end
    count == self.length
  end

  def my_any?
    count = 0
    self.my_each do |item|
      if block_given?
        count += 1 if yield(item) == true unless item.nil?
      else
        count += 1 if item == true
      end
    end
    count > 0
  end

  def my_none?
    count = 0
    self.my_each do |item|
      item = block_given? ? yield(item) : item
      count += 1 if item
    end
    count.zero?
  end

  def my_count
    count = 0
    self.my_each do
      count += 1
    end
    count
  end

  def my_map(&proc)
    result = []
    self.my_each { |item| result << proc.call(item) } if block_given?
    result
  end

  def my_inject(acc = nil)
    if acc.nil?
      acc = self[0]
      i = 1
    else
      i = 0
    end
    result = acc
    while i < self.length
      result = yield(result, self[i])
      i += 1
    end
    result if block_given?
  end
end

# module ends

def multiply_els(arr)
  arr.my_inject { |a, b| a * b }
end
