a = %w(1 2 200 4 4 6 6 7 7 18 27 72 81 9 91 425 31064 7920 67407 96488 34608557 71899703)

c = a.sort_by { |e| e[0].to_i }

c.sort! do |b, a| 
  x = b.to_i.digits.reduce(:+) <=> a.to_i.digits.reduce(:+)
  x.zero? ? b <=> a : b.to_i.digits.reduce(:+) <=> a.to_i.digits.reduce(:+)
end

p c

