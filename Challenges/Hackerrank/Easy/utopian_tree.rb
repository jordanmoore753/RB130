=begin 

a tree starts at height 1
on even periods, the height increases by 1
on odd periods, the height doubles

return the height of the tree after n cycles

=end

def utopianTree(n)
  height = 1
  n.times { |cycle| cycle.zero? || cycle.even? ? height *= 2 : height += 1 }
  height
end

p utopianTree(4)