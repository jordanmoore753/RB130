
a = 12
b = 1012

def findDigits(n)
  n.digits.select do |i| 
    next if i.zero?
    (n % i).zero?
  end.size
end

p findDigits(a)
p findDigits(b)

