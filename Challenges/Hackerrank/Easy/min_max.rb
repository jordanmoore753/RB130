def miniMaxSum(arr)
  arr.sort!
  "#{arr.slice(0, 4).reduce(:+)} #{arr[1, 4].reduce(:+)}"
end

p miniMaxSum((1..5).to_a)