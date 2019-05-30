=begin 

input = array
output = an array
rules = for array, output an array with sorted array
in ascending order with all the numbers between the 
lowest number and highest number, not including the
numbers in the original array.

if the array is in order or single, return an empty array


=end


def missing(arr)
  (arr.first..arr.last).to_a - arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []