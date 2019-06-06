# p [91, 99].reduce(:*)
=begin 

create a program that can detect palindromic PRODUCTS
in a given range.

default minimum is 1
no default for max

a palindromic product is the output of two integers
multiplied together that reads the same backwards
and forwards

[91, 99].reduce(:*) = 9009 (palindromic)

functions:
1. compile list of palindromes (the products) 
2. put the largest into a variable (largest product)
3. put the smallest into a variable (smalelst product)
4. compile a list of the FACTOR PAIRS that result in
(the pairs of integers that
multiply together to get the palindrome)
either the smallest product or largest product
- there can be more than one

if no min range, calculate the factors of the given max
that will be the largest 

1. got the inputs converted to a valid array of two numbers to
construct a range from.

I think that when we call largest, we are starting from the 
high end of range and going down

When we call smallest we are starting from low end of range aand
going up until we get a palindrome

Once we get the palindrome we stop iterating, return the pair
because we can get the palindrome by multiplying the pair
together

=end

class Palindromes
  attr_accessor :factors

  def initialize(num2)
    @range = convert_to_arr(num2)
    @largest = nil
    @smallest = nil
    @factors = []
  end

  def convert_to_arr(num)
    num.to_a.map { |sub_arr| sub_arr.reject { |n| n.instance_of?(Symbol) } }.flatten!
  end

  def generate
    if range.size < 2
      factors = compute_factors_one
    else
      factors = compute_factors_two
    end

    factors
  end

  def compute_factors_one
    factors, result = [], []
    numeral = range.join.to_i
    self_range = (1...numeral).to_a.reverse

    self_range.each do |num|
      if numeral % num == 0
        div = numeral / num
        result << [num, div]
        result << [div, num]
      end
    end

    factors << result
  end

  def compute_factors_two
    number_range = (range[1]..range[0]).to_a.reverse
    results = []

    number_range.each_with_index do |num, idx|
      p num, number_range[idx + 1]
      product = [num, number_range[idx + 1]].reduce(:*)
      results << [num, number_range[idx + 1]] if palindrome?(product)
      break if idx == number_range.size - 2
    end

    results
  end

  def palindrome?(number)
    number.to_s == number.to_s.reverse
  end

  def largest

  end

  private

  attr_reader :range
end

me = Palindromes.new(max_factor: 99, min_factor: 10)
p me.generate

p [17, 16].reduce(:*)
