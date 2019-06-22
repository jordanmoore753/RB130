=begin 

given an integer and an array
compute the absolute value of 
the first diagonal sum - second diagonal sum

integer determines the rows + columns of array
3 = 3x3

you can get the numbers by slicing the array into
3 slices by row size (integer)

then, get the first diagonal sum by adding the first..last
element (based on integer) incrementing one at a time

then, do the exact opposite. start from integer and work
  down to 0.


=end

def diagonalDifference(arr)
  result = [0, 0]
  arr.each_with_index { |sub_arr, idx| result[0] += sub_arr[idx] }
  arr.map(&:reverse).each_with_index { |sub_arr, idx| result[1] += sub_arr[idx] }
  result.reduce(:-).abs
end

a = [[11, 2, 4], [4, 5, 6], [10, 8, -12]]
p diagonalDifference(a)