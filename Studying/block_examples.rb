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

#

loop do 
  na = Proc.new { puts 'nah' }
  break
end

def dis(la)
  la.call
end

# loop do 
#   dis(na)
#   break
# end

# dis(na)

def call_me(some_code)
  some_code.call
end

name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin III"        # re-assign name after Proc initialization

call_me(chunk_of_code)

name = 'Doo'

#

roman_nums = %w(I IV V IX X XL L XC C CD D CM M).reverse
dec_equivalents = [1, 4, 5, 9, 10, 40, 50,
                   90, 100, 400, 500, 900,
                   1000].reverse

# ROMAN_NUMERALS = {}
# roman_nums.each_with_index { |key, idx| ROMAN_NUMERALS[key] = dec_equivalents[idx] }

# p ROMAN_NUMERALS

ROMAN = Hash[roman_nums.zip(dec_equivalents)]
p ROMAN