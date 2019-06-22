=begin 

given array of integers
calculate the fractions of its elements that
are positive, negative, and zero.
print the decimal of each fraction on a new line

a = [-4, 3, -9, 0, 4, 1]

input is an array
divide the amount of positive by total, negative by total, etc

p (2.0/6.0)
p '%.6f' % (2.0/6.0)

=end

def plusMinus(arr)
  totals = Array.new(3) { 0 }
  arr.each do |num|
    case 
    when num.positive? then totals[0] += 1
    when num.negative? then totals[1] += 1
    when num.zero? then totals[2] += 1
    end
  end

  totals.each { |i| puts '%.6f' % (i.to_f/arr.size.to_f)}
end

a = [-4, 3, -9, 0, 4, 1]
p plusMinus(a)



