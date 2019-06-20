=begin 

convert an ip address (ipv4) into int32
ip will be given as string

to convert to int32, you need to multiply
each number in ip by 256 ** 3, 2, 1, then just add
the last digit

values = [16777216, 65536, 256, 1]
iterate through the ip and map with index
multiply current num by equivalent index
in values

reduce the whole return value

=end

def ip_to_int32(ip)
  nums = ip.split('.').map(&:to_i)
  values = [16777216, 65536, 256, 1]
  nums.map.with_index { |i, idx| i * values[idx] }.reduce(:+)
end

p ip_to_int32("128.32.10.1")