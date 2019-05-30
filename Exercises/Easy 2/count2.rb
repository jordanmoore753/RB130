def count(one = nil, two = nil, three = nil)
  return 0 if [one, two, three] == [nil, nil, nil]
  unless block_given?
    raise TypeError, 'Must pass in block.'
  end

  counter, results = 0, 0
  arr = [one, two, three]

  while counter < arr.size
    results += 1 if yield(arr[counter])
    counter += 1
  end

  results
end

# or

# def count(*arguments)
#   total = 0
#   arguments.each { |item| total += 1 if yield(item) }
#   total
# end 

p count(1, 3, 6) { |value| value.odd? } 
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3