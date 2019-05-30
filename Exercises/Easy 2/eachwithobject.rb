def each_with_object(arr, second = [])
  unless arr.instance_of?(Array)
    raise TypeError, 'Must be an array.'
  end

  unless block_given?
    raise TypeError, 'Must be passed a block.'
  end

  counter = 0
  
  while counter < arr.size
    yield(arr[counter], second)
    counter += 1
  end

  second
end

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}