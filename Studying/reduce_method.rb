def reduce(arr, default = 0)
  if default.zero?
    skip_first = true
    sum = arr.first
  else
    sum = default
  end

  arr.each do |num|
    if skip_first
      skip_first = false
      next
    end

    sum = yield(sum, num)
  end

  sum
end

array = [1, 2, 3, 4, 5]
two = ['a', 'b', 'c']
p reduce(two) { |acc, val| acc += val }
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } 
p reduce(array, 10) { |acc, num| acc + num }