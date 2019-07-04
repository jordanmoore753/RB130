=begin 

given an array of integers, first find all of the pairs
of integers that subtracted == 1. for each element in the array, 
create a separate sub array that holds all of the elements
that subtracted by the iterating element == 1.

return the largest sub array's length as integer.

iterate through the array.
for each element, iterate through the remainder
  of the elements passed it, one at a time.

if the curr element - the second loop's element == 1,
add the two elements to the current array

at the end of the second loop's iteration, add the current array
to the results array

remove duplicates once the entire array has been
iterated through

find max subarray by length and then invoke length on it

=end

def pickingNumbers(a)
  result = []
  a.each_with_index do |number, idx|
    curr_arr = []
    break if idx == a.size - 1

    (a[idx]..a.size - 1).to_a.each do |num_two|
      p num_two
      if [number, num_two].reduce(:-).abs == 1
        curr_arr << number 
        curr_arr << num_two
      end
    end

    result << curr_arr.sort
  end

  result
end

b = [4, 6, 5, 3, 3, 1]
p pickingNumbers(b)