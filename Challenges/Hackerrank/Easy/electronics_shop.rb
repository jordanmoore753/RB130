=begin 

given two arrays and a max integer of what she can spend
first array = keyboards
second array = drives
integer = b

find the highest possible total for her to spend
on a keyboard and drive

she must buy both
she cannot pay exactly the cost of b

iterate through the keyboards array
for each element of keyboard,
  iterate throug the elements of drives
  reduce each element with the current element of
  keyboard, add the result to an array if
  it is less than b

pick the max value from the array
if there is none, return -1

=end

def getMoneySpent(keyboards, drives, b)
  result = []
  keyboards.each do |keyboard|
    drives.each do |drive|
      result << [keyboard, drive].reduce(:+) if [keyboard, drive].reduce(:+) < b
    end
  end

  result.empty? ? -1 : result.max
end

a, c = [3, 1], [5, 2, 8]
cost = 10

p getMoneySpent(a, c, cost)