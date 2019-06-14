# counter = 1
# arr = []
# n = 7

# until counter == 5
#   arr << (7 ** counter).to_s[-1].to_i
#   counter += 1
# end

# power = 358

# div, remainder = power.divmod(4)

# p arr[remainder - 1]

=begin 

create a program that can compute the last digit of an
insanely large number

the method is to populate an array with the 4 repeating
last digits of powers 1-4 of a number

these will repeat infinitely for a number

then, divide the powered number by 4, since we're looking
for the repeating 4 digits.

The remainder will be the index of the final digit
from the populated array (-1)

=end

def last_digit(n1, n2)
  counter = 1
  last_digits = []

  until counter == 5
    last_digits << (n1 ** counter).to_s[-1].to_i
    counter += 1
  end

  n2, idx = n2.divmod(4)
  last_digits[idx - 1]
end

p last_digit(7, 358)

