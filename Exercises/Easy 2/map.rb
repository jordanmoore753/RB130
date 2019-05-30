def map(arr)
  unless arr.instance_of?(Array)
    raise TypeError, 'Argument must be Array.'
  end

  unless block_given?
    raise TypeError, 'Must include a block.'
  end

  counter = 0
  results = []

  while counter < arr.size
    results << yield(arr[counter])
    counter += 1
  end

  results
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]