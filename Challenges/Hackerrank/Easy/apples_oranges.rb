=begin

a house is within s and t range
an apple tree is at point a
an orange tree is at point b
first array represents the distance from each
tree the apples/oranges are thrown

if the apple or range is within s..t
  then add 1 to the array : [apples, oranges]
  for the correct fruit

essentially, each number in the array must be
added to the starting point of the appropriate
tree. if the number is included in the range of
s..t then it increments the appropriate element
in the return array

7, 11, 5, 15, [-2, 2, 1], [5, -6]

=end
require 'set'

def countApplesAndOranges(s, t, a, b, apples, oranges)
  house = (s..t).to_a.to_set
  n = apples.select(&:positive?).reject { |i| !house.include?(a + i) }
  o = oranges.select(&:negative?).reject { |i| !house.include?(b + i) }
  puts [n.size, o.size]
end

p countApplesAndOranges(7, 11, 5, 15, [-2, 2, 1], [5, -6])