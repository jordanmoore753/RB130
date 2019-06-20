=begin 

create a program that can implement deadfish
this is a program that has 4 commands

i = increment by 1
d = decrement by 1
s = square the value
o = output the value into return array

starting from value 0
given a string, compute the value
with the given commands


=end

def parse(data)
  result, value = [], 0
  data.chars.each do |char|
    case char
    when 'i' then value += 1
    when 'd' then value -= 1
    when 's' then value = value ** 2
    when 'o' then result << value
    end
  end
  result
end

p parse("iiisdoso")