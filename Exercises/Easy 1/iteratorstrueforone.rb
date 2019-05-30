def one?(arr)
  count = 0
  true_count = 0

  while count < arr.size
    if block_given?
      true_count += 1 if yield(arr[count])
      return false if true_count > 1
    end

    count += 1
  end

  true_count == 1 
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }  