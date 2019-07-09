=begin
p 3 / 2

given an integer and an array of numbers,
determine how many pairs of one integer
there are

1, 1, 1 = 1 pair

for each unique integer in ar, check the count
  of that integer in the original array
add the dividend of count of that number / 2
to a variable result


=end

def sockMerchant(n, ar)
  unique_integers = ar.uniq
  unique_integers.map { |int| ar.count(int) / 2 }.reduce(:+) 
end 

a = 9
b = [10, 20, 20, 10, 10, 30, 50, 10, 20]
p sockMerchant(a , b)

