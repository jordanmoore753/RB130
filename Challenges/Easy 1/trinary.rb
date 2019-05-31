=begin 

problem: numbers must be converted from trinary
to decimal.

Trinary means that each place value is multiplied by
3 and its index in reverse

102012 => 1 * 3**5 + 0 * 3 **4 + 2 * 3**3 etc

so, determine if a number is a valid trinary
(can only have 0,1,2)

then, convert the string input into a reversed
array of integers. We reverse it because then we can
use with_index and raise 3 to the power of the index

then, add all of the results and that's the decimal equivalent.

the outcome should be 0 if the string is invalid

=end

class Trinary
  VALID_NUMS = ('0'..'2').to_a

  def initialize(str)
    @valid = valid?(str)
    @arr = str.each_char.map(&:to_i).reverse
  end

  def to_decimal
    return 0 if !valid
    arr.map.with_index { |n, idx| n * power_of(idx) }.reduce(:+)
  end

  private

  attr_reader :arr, :valid 

  def valid?(input)
    input.each_char { |char| return false if !VALID_NUMS.include?(char) }
    true
  end

  def power_of(num)
    3 ** num
  end
end
