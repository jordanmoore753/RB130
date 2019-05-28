# def times(num)
#   counter = 0

#   while counter < num do 
#     yield(counter) if block_given?
#     counter += 1
#   end

#   num
# end

# times(5) { |num| puts num }

# def each(arr)
#   counter = 0

#   while counter < arr.size
#     yield(arr[counter]) if block_given?
#     counter += 1
#   end

#   arr
# end

# each([1, 2, 3]) { |num| puts num }

# def select(arr)
#   arr1, counter = [], 0

#   while counter < arr.size
#     arr1 << arr[counter] if yield(arr[counter])
#     counter += 1
#   end

#   p arr1
# end

# array = [1, 2, 3, 4, 5]

# select(array) { |num| num.odd? }

def reduce(arr, start = 0)
  sum = start
  arr.flatten!
  counter = 0

  while counter < arr.size
    current_ele = yield(sum, arr[counter])
    sum = current_ele if !current_ele.nil?
    counter += 1
  end

  sum
end

array = [1, 2, 3, 4, 5]

reduce([1, 2, 3]) { |acc, num| acc + num if num.odd? }
reduce(array, 10) { |acc, num| acc + num }  
reduce(array) { |acc, num| acc + num }  
