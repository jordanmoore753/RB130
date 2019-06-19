=begin 

give the decimal equivalent of a roman numeral input
XXI = 21

essentially, we need to check each letter.
for each letter, add the equivalent decimal
to a running total.

if a I precedes an X or V, subtract 1.
if a X precedes a L or C, subtract 10.
if a C precedes a D or M, subtract 100.

we can iterate through the string with
chars.

have a hash populated with roman numerals
and their decimal equivalents.

first, check if the current numeral meets
any of the edge cases above.

if it doesn't add the value to the running
  total.

- 

check the edge case by looking at the next index
character. if it is a certain one, subtract
a certain amount from running total.

=end

def solution(roman)
  romans = %w(I IV V IX X XL L XC C CD D CM M).reverse
  romans_decimals = [1, 4, 5, 9, 10, 40,
                     50, 90, 100, 400, 500,
                     900, 1000].reverse
  roman_hsh = romans.zip(romans_decimals).to_h

  roman.chars.map.with_index do |char, idx| 
    is_subtraction?(char, roman[idx + 1]) ? subtract_value(char) : roman_hsh[char]
  end.reduce(:+)
end

def subtract_value(letter)
  case letter
  when 'I' then -1
  when 'X' then -10
  when 'C' then -100
  end
end

def is_subtraction?(letter, element)
  if letter == "I" && element == 'V' || letter == 'I' && element == 'X'
    true
  elsif letter == "X" && element == 'L' || letter == 'I' && element == 'C'
    true
  elsif letter == "C" && element == 'D' || letter == 'C' && element == 'M'
    true
  else
    false
  end 
end

p solution('XIX')

