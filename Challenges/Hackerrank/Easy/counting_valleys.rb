# a = %w(DDUUUUDD)
# a = a.join.chars

# valley = false
# valleys = 0
# running_total = 0

# a.each do |letter|
#   case letter
#   when 'D' then running_total -= 1
#   when 'U' then running_total += 1
#   end

#   valley = true if running_total <= -2

#   if running_total.zero? && valley
#     valleys += 1
#     valley = false
#   elsif running_total.zero? && !valley
#     valley = false
#   end
# end

# p valleys

def countingValleys(n, s)
  s = s.chars
  valley, valleys = false, 0
  running_total = 0

  s.each do |letter|
    letter == 'D' ? running_total -= 1 : running_total += 1
    valley = true if running_total <= -1

    if running_total.zero? && valley
      valleys += 1
      valley = false
    end
  end

  valleys
end

b = 'DUDDDUUDUU'

p countingValleys(10, b)
