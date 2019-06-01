=begin 


problem: verify that a given integer is a valid
number in accordance with Luhn algorithm

Luhn algorithm is saying that:
1. from right to left, double every second number
2. If its more than 10, subtract 9 from result
3. 1111 => 2121, 8763 => 7733.
4. Add all the digits together
5. If the digits end in the number 0, it is valid.

There are four methods assessed here:

addend: converts the number from base to luhn number
checksum: adds the converted number all together
valid? : checks if final digit is 0
create : creates a valid base from which to create a 
Luhn number

873956 => 776936
8739567 => 8539557

the final create will be checking first if the checksum
total is valid, if it isn't, start with 0 as the last digit
and repeat the process of checksum and valid

first one to be valid is returned

=end

class Luhn
  def initialize(num)
    @num = num.digits.reverse
  end

  def addends
    result = []
    counter = -1

    until counter < (-num.size)
      if counter.even?
        num[counter] * 2 >= 10 ? result << (num[counter] * 2) - 9 : result << num[counter] * 2
      else
        result << num[counter]
      end

      counter -= 1
    end

    result.reverse
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    checksum.digits.reverse.last == 0
  end

  def self.create(int)
    int = int.digits.reverse
    curr_loop = nil
    count = 0

    loop do
      curr_loop = append_int(int, count)
      break if curr_loop.reduce(:+).digits.reverse.last == 0 || count > 10

      count += 1
    end

    (int << count).map(&:to_s).join('').to_i
  end

  def self.append_int(arr, increment)
    array = arr.clone
    result, counter = [], -1
    array << increment

    until counter < (-array.size)
      if counter.even?
        array[counter] * 2 >= 10 ? result << (array[counter] * 2) - 9 : result << array[counter] * 2
      else
        result << array[counter]
      end

      counter -= 1
    end

    result.reverse
  end

  private

  attr_reader :num, :addend_result, :checksum_result
end

# p me = Luhn.create(873956)
