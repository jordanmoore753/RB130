=begin 

problem: finding the sum of all multiples up to a number
for an indeterminite amount of numbers

so we may be finding all multiples up to not including 10
for the numbers 3 and 5

3+6+9 = 18 + 5 = 23

default is 3 and 5

check if arguments are empty, if so, default to 3 and 5

calculate the multiples of each number, add to an array

add all of the numbers in the array up

return the answer

=end

class SumOfMultiples
  def initialize(*arguments)
    @arr = assign_args(arguments) 
  end

  def self.to(input, mults = [3, 5])
    mults.map { |i| multiples(i, input) }.flatten.uniq.reduce(:+)
  end

  def to(n)
    self.class.to(n, arr)
  end

  private

  attr_reader :arr 

  def assign_args(input)
    input.empty? ? [3, 5] : input
  end

  def self.multiples(num, total)
    results = []
    curr_multiple = num 

    while curr_multiple < total
      results << curr_multiple
      break if curr_multiple + num >= total
      curr_multiple += num
    end

    results.empty? ? 0 : results
  end
end

# me = SumOfMultiples.new(43, 47)
# p me
# p me.to(10000)
#p SumOfMultiples.to(4)