=begin 

create a parity bit checker
and removal tool

check to make sure there are an odd number
of 1's in the string without counting
the parity bit.

if there is an odd number, return
  just the first 7 characters
  of the string

if there is an even number, return
  'error' in place of the string

=end

def parity_bit(bits)
  bits.split.map { |word| word.count('1').even? ? word[0...-1] : 'error' }.join(' ')
end

p parity_bit("00111100 00111101")
