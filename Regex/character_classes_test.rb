# a = 261354
# b = a.digits.reverse

# c = b[2]

# # b[0], b[2] = b[2], b[0]
# # p b

# def smallest(n)
#   smallest_number = n 
#   smallest_index_and_insert_idx = []

#   digits_arr = n.digits.reverse
#   tiny_digit = [digits_arr.min]
  
#   tiny_digit.each do |number|
#     digits_arr.each_with_index do |second, idx|
#       poss_small_num = digits_arr.dup
#       tiny_index = poss_small_num.index(number)
#       poss_small_num.insert(idx, poss_small_num[tiny_index])
#       poss_small_num.delete_at(tiny_index + 1)
#       p poss_small_num
#       if poss_small_num.map(&:to_s).join.to_i < smallest_number
#         smallest_number = poss_small_num.map(&:to_s).join.to_i
#         smallest_index_and_insert_idx = [idx, tiny_index]
#       end
#     end
#   end

#   [smallest_number, smallest_index_and_insert_idx].flatten
# end

# p smallest(261235)

str = '(716) 485-6622'
p str.scan(/[0-9]/).count
