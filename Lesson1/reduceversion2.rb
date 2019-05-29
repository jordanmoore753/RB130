
# reduce needs to see if all elements are the same
# if all elements the same and string, sum is ''
# if all elements not the same, sum is []
# if all elements are number, sum is 0

def reduce(arr, start = nil)
  arr.flatten!
  all_same = true

  if arr.all? { |ele| ele.kind_of?(String) }
    sum = ''
  elsif !start.nil?
    sum = start
  elsif arr.all? { |ele| ele.kind_of?(Integer) }
    sum = 0
  else
    sum = []
    all_same = false
  end

  counter = 0

  while counter < arr.size
    if all_same
      current_ele = yield(sum, arr[counter])
    else
      current_ele = yield(sum, [arr[counter]])
    end

    sum = current_ele if !current_ele.nil?
    counter += 1
  end

  sum
end

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value }

p reduce([1, 2, 3]) { |acc, num| acc + num if num.odd? }

array = [1, 2, 3, 4, 5]

p reduce(array, 10) { |acc, num| acc + num }  
p reduce(array) { |acc, num| acc + num }  