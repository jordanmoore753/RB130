=begin 

two kangaroos start hopping consistent distances
from different spots

x1 = starting location for 1st kang
x2 = starting location for 2nd kang
v1 = jump size for first kang
v2 = jump size for second kang

if x2 and v2 are greater than both x1 and x2,
it's a NO, and vice versa

if the two x's reach the same point (number) at the
  same time, return YES and stop iterating


=end

def kangaroo(x1, v1, x2, v2)
  return 'NO' if x2 > x1 && v2 >= v1
  return 'NO' if x1 > x2 && v1 >= v2
  10000.times do 
    x1 += v1
    x2 += v2
    return 'YES' if x1 == x2
  end

  'NO'
end

p kangaroo(0, 2, 5, 3)
p kangaroo(0, 3, 4, 2)