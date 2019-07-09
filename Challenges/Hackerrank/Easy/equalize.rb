def equalizeArray(arr)
  arr.select { |num| num != arr.max_by { |num| arr.count(num)} }.size
end

p equalizeArray([3, 3, 2, 1, 3])