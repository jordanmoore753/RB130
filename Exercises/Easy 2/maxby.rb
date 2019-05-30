def max_by(arr)
  unless arr.instance_of?(Array)
    raise TypeError, 'Must be an array.'
  end

  return nil if arr.empty?

  counter = 1
  largest = arr.first

  while counter < arr.size
    largest = arr[counter] if yield(arr[counter]) > yield(largest)
    counter += 1
  end

  largest
end

max_by([1, 5, 3]) { |value| value + 2 } == 5
max_by([1, 5, 3]) { |value| 9 - value } == 1
max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil