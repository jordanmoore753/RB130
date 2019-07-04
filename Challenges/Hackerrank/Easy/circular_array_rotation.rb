require 'set'

def circularArrayRotation(a, k, queries)
  if !(k % a.size).zero? 
    k.times do
      a.rotate!(-1)
    end
  end

  queries.map { |idx| a[idx] }
end

b = [1, 2, 3]
c = 2
d = [0, 1, 2]

p circularArrayRotation(b, c, d)
p 100000 % 1