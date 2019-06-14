# a = (1..531).to_a
# b = 531.digits.sort
# d = ''
# d = a.each { |i| return i if i.digits.sort == b }

# d == '' ? -1 : d 
# p d



def next_smaller n
  digit_arr = n.digits.reverse
  curr_iter = digit_arr.dup
  fir_counter, sec_counter = -1, -2
  const_count, result = -1, []

  until const_count == -digit_arr.size
    until sec_counter < -digit_arr.size
      curr_iter[fir_counter], curr_iter[sec_counter] = curr_iter[sec_counter], curr_iter[fir_counter]
      p curr_iter
      if curr_iter.join('').to_i < n
        result << curr_iter.join('').to_i
      end

      fir_counter -= 1
      sec_counter -= 1
    end

  
    curr_iter = digit_arr.dup
    const_count -= 1
    fir_counter = const_count
    sec_counter = const_count - 1
  end

  result
end

p next_smaller(531)
p next_smaller(2071)
p next_smaller(414)
p next_smaller(123456798)
p next_smaller(315)
