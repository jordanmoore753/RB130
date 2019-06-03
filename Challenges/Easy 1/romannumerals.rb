=begin 

problem: convert decimals to roman numerals
process: counting from left to right,
ignore any 0's. A certain letter means
a certain number.

I = 1
V = 5
X = 10



=end

# class Integer
#   def to_roman
#     x = self
#     result = []

#     until x.zero?
#       if x >= 1000
#         x -= 1000
#         result << 'M'
#       elsif x >= 900
#         x -= 900
#         result << 'CM'
#       elsif x >= 500
#         x -= 500
#         result << 'D'
#       elsif x >= 400
#         x -= 400
#         result << 'CD'
#       elsif x >= 100
#         x -= 100
#         result << 'C'
#       elsif x >= 90
#         x -= 90
#         result << 'XC'
#       elsif x >= 50
#         x -= 50
#         result << 'L'
#       elsif x >= 40
#         x -= 40
#         result << 'XL' 
#       elsif x >= 10
#         x -= 10
#         result << 'X'
#       elsif x >= 9
#         x -= 9
#         result << 'IX'
#       elsif x >= 5
#         x -= 5
#         result << 'V'
#       elsif x >= 4
#         x -= 4
#         result << 'IV'
#       elsif x >= 1
#         x -= 1
#         result << 'I'
#       else
#         break
#       end  
#     end

#     result.join('')
#   end
# end

class Integer

  ROMANS_VALUES = 
  { 
  1000 => 'M', 
  900 => 'CM', 
  500 => 'D',
  400 => 'CD',
  100 => 'C',
  90 => 'XC',
  50 => 'L',
  40 => 'XL',
  10 => 'X',
  9 => 'IX',
  5 => 'V',
  4 => 'IV',
  1 => 'I'
  }

  def to_roman
    roman_numeral = ''
    num = self

    until num.zero?
      ROMANS_VALUES.each do |key, val|
        div, mod = num.divmod(key)
        roman_numeral += val * div
        num = mod
      end
    end

    roman_numeral
  end
end

# puts 1024.to_roman
# p 1024 / 1000
