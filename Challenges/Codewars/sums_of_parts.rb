=begin 

given an array, find the total of each sub_array
slice from 0..-1, 1..-1, 2..-1, etc.

return the array with all totals

array must end with 0

array must be one bigger than original array because
of the extra 0

iterate over the original array
the current element by index until the end as a slice
and reduced to its sum gets added to results
if the index is last element,
  add the number to results and also 0 to results

return array

=end

def parts_sums(ls)
  return [0] if ls.empty?
  new_arr = [0] + ls.reverse

  r2 = Array.new(ls.size) do |idx| 
    
  end

  # r2 += [0]

  new_arr
  # until count == ls.size
  #   if count == ls.size - 1
  #     r2[count] = ls[count]
  #     r2[count + 1] = 0
  #   else
  #     r2[count] = ls[count..-1].reduce(:+)
  #   end

  #   count += 1
  # end

  # ls.each_with_index do |num, idx|
  #   if idx == ls.size - 1
  #     r2[idx] = num
  #     r2[idx + 1] = 0
  #   else
  #     r2[idx] = ls.slice(idx..-1).reduce(:+)
  #   end
  # end


end

p parts_sums([0, 1, 3, 6, 10])
