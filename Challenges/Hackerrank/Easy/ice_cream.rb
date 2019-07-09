def icecreamParlor(m, arr)
  result = [0, 0]
  arr[0...arr.size - 1].each_with_index do |number, f_idx|
    arr[arr.index(number) + 1...arr.size].each_with_index do |num_two, s_idx|
      if number + num_two == m
        result[0] = arr.index(number) + 1
        number == num_two ? result[1] = arr.size - arr[num_two...arr.size].size : 
                            result[1] = 1 + arr.index(num_two)
        break
      end
    end
  end

  result
end

a = [1, 4, 5, 3, 2]
b = 4
c = [2, 2, 4, 3]
d = 4
e = 9
f = [1, 3, 4, 6, 7, 9]
p icecreamParlor(e, f)
