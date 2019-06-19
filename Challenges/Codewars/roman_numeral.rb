=begin 

take a positive integer and convert
it to a STRING
containing the ROMAN NUMERAL 
representation of that integer

essentially, we need to figure out how many
of each number (1000, 900, 500, 400 etc) are in
the positive input

that number of times that number is divided
by a certain roman numeral decimal is the amount
of times that roman numeral letter should
appear. 2000/ 2 (MM) , 1000/ 1 (M)

By including the 9's (exceptions to the rule)
we can rule out the possibility of repeating
3 digits in a row

create a hash with all roman numerals as keys
and all values as their decimal representation

iterate through the hash. 
run divmod on the current value and the divisor
is the integer.
the div will be multiplied by the roman key
currently iterated over.
the integer will be re-assigned to the remainder of each
iteration.

return the string 


=end

def solution(number)
  romans = %w(I IV V IX X XL L XC C CD D CM M).reverse
  romans_decimals = [1, 4, 5, 9, 10, 40,
                     50, 90, 100, 400, 500,
                     900, 1000].reverse
  roman_hsh = romans.zip(romans_decimals).to_h

  roman_hsh.map do |roman, decimal|
    div, number = number.divmod(decimal)
    roman * div
  end.join('')
end

p solution(1)
p solution(19)
# p solution(6)
# p solution(4)