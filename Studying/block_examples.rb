def what_is(code)
  code.call
end

cat = 'Meow'
code_chunk = Proc.new { puts "Her name is #{cat}."}
cat = 'Kitty'

loop do 
  cat = 'Smoke'
  break
end

what_is(code_chunk)

#
name = 'Sam'

chunky = Proc.new { puts "#{name} is #{age}."}

name = 'Sam'

def age
  3
end

# oh = Proc.new { 'Johan' }

def caller(block)
  block.call
end

caller(chunky)

#

def test2(block)
  puts 'hello'
  block.call 
  puts 'goodbye'
end

def test(&block)
  puts '1'
  test2(block)
  puts '2'
end

test { puts 'abc' }

#

def mutate_string(str)
  puts str
  yield(str) if block_given?
  puts str
end

mutate_string('ohbaby') { |word| word.upcase! }

# 

def some(str)
  str = yield(str)
  p str
end

some('going') { |word| word += '!' }

#

def make(yeah)
  arr = [1, 2, 3]
  num = yeah.call(arr.first)
  p num
end

cate = Proc.new do |num|
  num + 1
end

make(cate)