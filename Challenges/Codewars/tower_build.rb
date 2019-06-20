=begin 

build a tower given a number of rows
   #
  ###
 #####

n = 3

tower is starting from 1
+ 2 to each row
1, 3, 5, 7, 9

space on side of each row is: length of last row - current length of row / 2
each element is string
return array at end

create array to start using each from a range of 1..10000
break when array size is equal to n

n = 3
b = []
(1..1000).to_a.each do |i|
  break if b.size == n 
  b << i if i.odd?
end

then iterate over that array
map so return value is correct array
spaces = ' ' * array.last - curr_value
middle = '*' * curr_value
"spaces middle spaces"

=end

def towerBuilder(n_floors)
  result = []
  (1..10000).to_a.each do |num|
    break if result.size == n_floors
    result << num if num.odd?
  end
  
  result.map do |num|
    spaces = ' ' * ((result.last - num) / 2)
    middle = '*' * num
    spaces + middle + spaces
  end
end

p towerBuilder(4)