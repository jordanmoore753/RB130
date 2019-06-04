def select(array)
  array.each_with_object([]) { |ele, obj| obj << ele if yield(ele) }
end

arr = [1, 2, 3, 4, 5]

p select(arr) { |n| n.odd? }
p select(arr) { |n| puts n }
p select(arr) { |n| n + 1 }