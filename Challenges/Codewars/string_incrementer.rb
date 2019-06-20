=begin 

given a string, if it ends with a number
add 1 to the number and return the string
if it doesn't the number 1 should be appended
to the new string

leading zeros should be taken into account

check if the string ends in a number (-1) == /0-9/
if it doesn't, string += '1'

if it does, figure out what the number is, including
leading zeros

scan the string for the numbers 0-9, then join them
and convert to an integer

add 1 and gsub the original string number for the
result

=end

def increment_string(input)
  return input += '1' if !(/[0-9]/).match?(input[-1])
  original_number = input.scan(/\d/).join
  new_number = (original_number.to_i + 1).to_s
  original_number.length - new_number.length < 0 ? zeros = 0 : zeros = original_number.length - new_number.length
  input.gsub(original_number, '0' * zeros + new_number)
end

p increment_string('foo')
p increment_string('foobar001')
p increment_string('foobar099')
p increment_string('kvcm130')