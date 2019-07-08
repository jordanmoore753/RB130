=begin 

  iter_arr.reverse.each_with_index do |number, idx|
    if number < end_num
      iter_arr = iter_arr.reverse.insert(idx, end_num).reverse
      p iter_arr
      break
    else
      p iter_arr
    end
  end

=end


def insertionSort1(n, arr)
  sorted_arr = arr.sort
  end_num = arr.slice!(-1)
  iter_arr = arr.dup

  iter_arr.reverse.each_with_index do |number, idx|
    if number > end_num
      idx.zero? ? arr << number : arr[-(idx + 1)] = number
    else number < end_num
      arr[-(idx + 1)] = end_num
    end

    puts arr.join(' ')
    break if sorted_arr == arr
  end

  if arr != sorted_arr
    arr[0] = end_num
    puts arr.join(' ')
  end
end


a = 5
b = [2, 4, 6, 8, 3]
c = 10
d = %w(2 3 4 5 6 7 8 9 10 1).map(&:to_i)
#insertionSort1(a, b)
insertionSort1(c, d)