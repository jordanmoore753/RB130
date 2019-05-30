=begin 

problem: convert octal to decimal conversion
this is done by:
'155'
1* 8(octal)**2(place value) + 5*8**1 + 5*8**0
= 109

essentially, the size of the array - 1 is the first
number to be squared. for each element, the number is 1 less.

first, the input number must be rid of any leading
zeros in its string.

second, we've gotta get the str turned into an array
and turned into integers.

third, we've gotta add up all of the numbers to get 
the new decimal.

=end

class Octal
  VALID_OCTAL = ('0'..'7').to_a 

  def initialize(num)
    @valid = valid?(num)
    @num = num.each_char.map(&:to_i).reverse
  end

  def to_decimal
    return 0 if !valid
    num.map.with_index { |n, idx| n * power_of(idx) }.reduce(:+)
  end

  private

  attr_reader :num, :valid

  def valid?(n)
    n.each_char { |char| return false if !VALID_OCTAL.include?(char) }
    true
  end

  def power_of(int)
    8 ** int
  end
end
