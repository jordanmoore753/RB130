=begin

given an array of integers, an integer denoting a desired
sum, and an integer denoting a desired slice length,
find all the slices of the array that add
up to a certain integer and are of a certain size

s = array of integers 
d = birthday (sum of slice)
m = birth month (size of slices)

create an array of all the slices with m as the 
argument to each_slice

reject all elements of this array that do not sum
  to d

return the size of the array

a = [2, 2, 1, 3, 2]
x = a.each_slice(2).to_a
x.select { |sub| sub.reduce(:+) == d }.size

=end

a = [1, 2, 1, 3, 2]
b = 3
c = 2

i = [4]
j = 4
k = 1

l = %w(2 5 1 3 4 4 3 5 1 1 2 1 4 1 3 3 4 2 1).map(&:to_i)
o = 18
u = 7

def birthday(s, d, m)
  cake_slices, counter = [], 0
  s.each do |num| 
    cake_slices << s.slice(counter, m) 
    counter += 1
  end
  cake_slices.select { |sub| sub.reduce(:+) == d && sub.size == m }.size
end

p birthday(i, j, k)
p birthday(a, b, c)
p birthday(l, o, u)