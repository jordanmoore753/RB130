=begin 

given two arrays, find the number of integers meet
the following conditions:

1. compute the factors of the lowest number from
second array. then, keep the factors that divide evenly by
BOTH of the integers in first array.

2. keep the factors that divide evenly by each of the integers
in second array.

y = 2.step(16, 2).to_a
z = 4.step(16, 4).to_a
xx = y += z
xx.reject! { |i| xx.count(i) < 2 }
p xx.uniq!

this keeps only the numbers that both are divided
evenly by 2 and 4.

then, we iterate through the factors
and select the numbers that are evenly divisible
by each number in the second array

for each element in the factors array, modulo
it by each element in the second array. if each modulo
returns 0, return true.

=end

def getTotalX(a, b)
  
end

a = [2, 4]
b = [16, 32, 96]
p getTotalX(a, b)

