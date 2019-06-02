=begin 

a perfect number is where all the factors added up
together equal the number they are a factor of

6 is perfect: 1, 2, 3 = 6
28 is perfect: 1, 2, 4, 7, 14

abundant means that the factors added up are more
than the number

deficient means the opposite

it is a runtime error if the input number is less than or equal
to 0


=end

class PerfectNumber
  def self.classify(num)
    raise RuntimeError if num <= 0

    display_type(factors_sum(num), num)
  end

  def self.factors_sum(input)
    range = (1...input).to_a
    range.select { |number| input % number == 0 }.reduce(:+)
  end

  def self.display_type(new_num, input)
    if new_num < input
      return 'deficient'
    elsif new_num > input
      return 'abundant'
    else
      return 'perfect'
    end
  end
end

#p PerfectNumber.classify(28)