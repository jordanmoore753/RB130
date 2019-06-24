=begin 

given an array of different types of birds and
their frequency, (1..5 are types)..

determine which bird type appeared most. 
if two of them are equally frequent, pick the
one with the smaller type number (1 over 2).


=end

ar = [1, 4, 4, 4, 5, 3]
two = [1, 1, 2, 2, 3]

def migratoryBirds(arr)
  freq = arr.inject(Hash.new(0)) { |k, v| k[v] += 1; k}
  max = freq.values.max
  freq.select { |k, f| f == max }.sort.first[0]
end

p migratoryBirds(two)
