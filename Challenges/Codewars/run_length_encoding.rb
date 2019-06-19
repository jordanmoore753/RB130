=begin 

given a string of uppercase characters,
return a string with each character 
and its frequency to its left

AAABBC
3A2B1C

iterate over an array of chars with all duplicates
removed

for each char, get its count from the original 
  array

return value of each argument in block is
its frequency and char

for decoding:

split the string into an array and then a hash

iterate over the hash

for each key, print the value that many times

p 'AAABBBCCCDA'.scan(/(.)\1*/)

=end

def encode(s)
  counter = 0
  result = []

  s.chars.each_with_index do |char, idx|
    counter += 1
    if s[idx + 1] != char 
      result << [counter, char]
      counter = 0
    end
  end

  result.map { |sub| "#{sub[1]}#{sub[0]}" }.join('')
end

def decode(s)
  characters = s.chars.select { |i| i.match(/[A-Z]/)}
  s.scan(/\d+/).map.with_index { |num, idx| characters[idx] * num.to_i }.join('')
end

p encode('AAABBBCCCDA')
p decode("10A1B")

p x = 2110.to_s.reverse

"%03d" % x if x.chars.first == '0'

