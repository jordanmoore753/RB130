
=begin 

write a program that can detect palindrome
products in a given range

every possible combination of two numbers
between the range limits must be included

10..19

10, 11
10, 12
10, 13..

if the product of the two factors is a palindrome,
  meaning the same backwards and forwards,
  it is stored away for later
  in addition to its factors

if no min limit is described, it is 1

looping structure:

(1..9).each do |num|
  (num..9).each do |second_num|
    a << [num, second_num]
  end
end

this will compile the entire list of 
multiples for later reduce

methods:
1. generate
2. largest
3. smallest

largest and smallest will both be methods that create 
structs of the same name

These structs will have access to the value and factor
instance variables

They will have custom getter methods for accessing 
both value and factor instance variables

ex. largest.value => 9 (the largest factor)
ex. largest.factors => [3,3], [1,9]

=end

class Palindromes
  attr_accessor :range, :multiples, :factors, :value

  def initialize(range)
    @range = populate_range(range)
    @multiples = populate_multiples
    @factors = []
    @value = []
  end

  def populate_range(range)
    range_arr = range.to_a
    if range_arr.size == 1
      return (1..range_arr[0][1]).to_a
    else
      return (range_arr[1][1]..range_arr[0][1]).to_a
    end
  end

  def populate_multiples
    result = []
    range.each do |number|
      (number..range.last).each do |second_num|
        result << [number, second_num]
      end
    end

    result
  end

  def palindrome?(product)
    product.to_s == product.to_s.reverse
  end

  def generate
    multiples.each do |sub_arr| 
      if palindrome?(sub_arr.reduce(:*))
        @factors << sub_arr
        @value << sub_arr.reduce(:*)
      end
    end
  end

  def largest
    Largest.new(factors, value)
  end

  def smallest
    Smallest.new(factors, value)
  end
end

class Largest 
  def initialize(all_factors, values)
    @all_factors = all_factors
    @largest_value = values
  end

  def value
    @largest_value.max
  end

  def factors
    @all_factors.select { |sub_arr| sub_arr.reduce(:*) == value }
  end
end

class Smallest
  def initialize(all_factors, values)
    @all_factors = all_factors
    @value = values
  end

  def value
    @value.min
  end

  def factors
    @all_factors.select { |sub_arr| sub_arr.reduce(:*) == value }
  end
end

