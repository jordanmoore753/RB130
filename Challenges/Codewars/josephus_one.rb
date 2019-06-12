# def josephus(items,k)
#   return items if k == 1
#   stop_counter, counter = k - 1, 0
#   orig_size = items.size
#   result, idx_counter = [], 0
  
#   until result.size == orig_size
#     until counter == stop_counter
#       counter += 1
#       idx_counter + 1 > items.size - 1 ? idx_counter -= items.size - 1 : idx_counter += 1
#       result << items.delete_at(idx_counter) if counter == stop_counter
#     end
    
#     result << items.delete_at(0) if items.size == 1
#     counter = 0
#   end

#   result
# end

# or

a = [1, 2, 3, 4, 5, 6, 7]
b = %w(1 2 3 4 5 6 7 8 9 10).map(&:to_i)

def josephus(items, k)
  Array.new(items.length) { items.rotate!(k - 1).shift }.last
end

p josephus(a, 3)
p josephus(b, 1)
