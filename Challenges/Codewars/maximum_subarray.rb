=begin 

input = array (empty or an array with positive and negative integers)
output = the maximum sum of positive integers in array
data = arrays, all arrays

this is a question of which subarray [0..-1] has
the highest sum. So, I'll need to iterate through the array
in order to determine which subarray has the highest sum.

For each element, get the sum of it sliced with all
the indexes after it, one at a time.

a = [1, 2, 3, 4]
1st: [1]
2nd: [1, 2] => 3
3rd: [1, 3] => 4
4th: [1, 4] => 5
5th: [2] => 2
6th: [2, 3] => 5
7th: [2, 4] => 6
...

I'll have a variable that will track which sum is highest
if the current sum is higher, the overall sum will be re-assigned
to the current sum.

if all numbers are negative, return 0
if array is empty return 0

Have a while loop that runs while the curr_element
is less than or equal to array's size

inside of that, for each time a curr_element is equal
to the counter, just compare that value to the highest one
if it's more, reassign 

if the counter is higehr than curr_element's index,
slice the array (currelement, counter) and sum it
compare it against highest value
reassign if necessary

=end

def max_sequence(arr)
  return 0 if arr.empty? || arr.all? { |i| i < 0 }
  curr_element, second_count = 0, 0
  highest_sum = 0

  until curr_element == arr.size
    until second_count == arr.size
      curr_value = 0
      curr_element == second_count ? curr_value = arr[curr_element] : curr_value = arr[curr_element..second_count].reduce(:+)
      highest_sum = curr_value if curr_value > highest_sum
      second_count += 1
    end

    curr_element += 1
    second_count = curr_element
  end

  highest_sum
end

#p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) # 12
#p max_sequence([-25, 12, 22]) 93
p max_sequence([11])
p max_sequence([-23, 23, -10, -9, -6, -8, 1, 16, 19, 21, 4, 12, -25, -25, -23, 4, 24, -6, -6, 0, -18, 25, 24, -23, 8, 9, 12, -2, -9, -4, 17, 19, 15, 1, -21, 3, 19, -5, -24, -13, 12, -4, -4, 10, -25])




