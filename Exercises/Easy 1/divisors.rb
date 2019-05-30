=begin 

input = integer
output = array of integers
rules = for integer, return an array containing
all divisors of input that modulo to 0 (divide evenly).


=end


def divisors(num)
  1.upto(num).select { |n| (num % n).zero? }
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]