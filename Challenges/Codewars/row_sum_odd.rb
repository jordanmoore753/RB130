=begin 

construct a pyramid of odd numbers
1
3 5
7 9 11
13 15 17 19

and return the sum of all odd numbers in
the nth row

we can do this by populating an array with all
elements of a range of 1..10000 and selecting only
odds

then, we initialize a counter of 0
and add counter of 0
and in a new arrray, append the sub array of

=end


def row_sum_odd_numbers(n)
  return 1 if n == 1
  odds = (1..10000).to_a.select!(&:odd?)
  triangle_size = (1...n).to_a.reduce(:+)
  odds[triangle_size...triangle_size + n].reduce(:+)
end

p row_sum_odd_numbers(74)