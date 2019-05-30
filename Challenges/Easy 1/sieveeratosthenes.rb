=begin 

problem: find the prime numbers between 2 and a given
number.
do this in a very specific way: the sieve of Eratosthenes
this is a process by which:
1. create a range from 2 to n
2. for each prime number, mark every multiple of that prime
3. once each prime number is done, you will be left with only
the prime numbers between 2 and n.

check if a number is prime
if it is prime, then run the composite method

keep a collection of every number that is a multiple
do this for each prime

get rid of all numbers from that collection
that holds all multiples of the primes

all_nums = (2..n).to_a

2..num do |n|
  if prime?(n)
    multiples << composites(n) 
  end

composite method

gotta have an empty array to add to
=end

require 'prime'

class Sieve
  def initialize(n)
    @n = n
  end

  def primes
    range = (2..n).to_a
    multiples = []

    range.each do |num|
      multiples << composites(num) if Prime.prime?(num)
    end

    return_primes(range, multiples)
  end

  private

  attr_reader :n

  def multiple?(int, int2)
    int % int2 == 0
  end

  def composites(prime)
    range = (prime * 2..n)
    
    range.select { |num| multiple?(num, prime) }
  end

  def return_primes(all_nums, composites)
    composites.flatten!.uniq!.sort!
    all_nums - composites
  end
end

sieve = Sieve.new(1000)
p sieve.primes