# p 128.to_s(2)

# a = 128 * 256 ** 3
# p a

=begin 

create a program that can convert signed int32
numbers into an ip address

we need to convert the int32 into its constituent
decimal numbers
then convert the decimal numbers into binary
then join the binary numbers into
an ip string

binary = dec.to_s(2)
int32 conversion:

[128, 23, 0, 1]
128 * 256 ** 3, 128 * 256 ** 2, 128 * 256 ** 1, + last element

so just do the opposite

return the value of

[16777216, 65536, 256, 1]

total_number.divmod(arr[counter])
counter += 1
total_number = remainder
dividend gets put in new array

then map on the array and call to_s on each
element, then join the strings with (.)
=end

def int32_to_ip(int32)
  values = [16777216, 65536, 256, 1]
  result, total_number = [], int32

  values.map do |number|
    if number == 1
      total_number
    else
      div, total_number = total_number.divmod(number)
      div
    end
  end.join('.')
end

p int32_to_ip(2154959208)

# b = 
# a = 128 * 256 ** 3
# c, d = b.divmod(16777216)
# e, f = d.divmod(65536)
# p e
