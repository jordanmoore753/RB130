def drop_while(arr)
  unless arr.instance_of?(Array)
    raise ArgumentError, 'Must be an array.'
  end

  unless block_given?
    raise TypeError, 'Must be given a block.'
  end

  counter = 0
  results = []

  while counter < arr.size
    if !yield(arr[counter]) || yield(arr[counter]).nil?
      results << arr.slice(counter..arr.size + 1)
      break
    end

    counter += 1
  end

  results.flatten
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } 
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []