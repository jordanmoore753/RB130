=begin 

a beautiful day is one whose integer - integer.reverse / k is
evenly divisible (% == 0)

=end

def beautifulDays(i, j, k)
  (i..j).to_a.select { |num| (num - num.to_s.reverse.to_i) % k == 0 }.size
end

p beautifulDays(20,23,6)