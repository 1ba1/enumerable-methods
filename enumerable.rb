module Enumerable
  def my_each
		for item in self
			yield(item)
		end
		return self if block_given?
	end

  def my_each_with_index
    count = 0
		for item in self
			yield(item, count)
      count += 1
		end
		return self if block_given?
	end

  def my_select
    array = []
    for item in self
      array.push(item) if yield(item) == true
    end
    return array if block_given?
  end

  def my_all?
    count = 0
    for item in self
      count +=1 if yield(item) == true
    end
    if count == self.length
      return true
    else
      return false
    end
  end

  def my_any?
    count = 0
    for item in self
      count +=1 if yield(item) == true
    end
    if count > 0
      return true
    else
      return false
    end
  end

  def my_none?
    count = 0
    for item in self
      count +=1 if yield(item) == true
    end
    if count == 0
      return true
    else
      return false
    end
  end

  def my_count
    count = 0
    for item in self
      count +=1
    end
    return count
  end

  def my_map
    array = []
    for item in self
      array.push(yield(item))
    end
    return array if block_given?
  end

  def my_inject
    for item in self
      result = yield(result, item)
    end
    return result
  end

end # module ends
