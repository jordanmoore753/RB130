# def each(collection)
#   counter = 0

#   while counter < collection.size
#     yield(collection[counter])
#     counter += 1
#   end
  
#   collection
# end

# arr = [1, 3, 5]

# p each(arr) { |num| puts num }

# #

# def map(collection)
#   results = []
#   counter = 0

#   while counter < collection.size
#     results << yield(collection[counter]) if block_given?
#     counter += 1
#   end

#   results
# end

# arr2 = [1, 3, 45]

# p map(arr2) { |num| num * 2 }

# 

def display_msg(msg)
  msg.call
end

name = 'Jun'
command = Proc.new { puts name }

display_msg(command)

# 

def test1(block)
  puts 'top bun'
  block.call
  puts 'bottom bun'
end

def test2(&block)
  puts 'first in test2'
  test1(block)
  puts 'end in test2'
end

test2 { puts 'middle of sandwich!'}