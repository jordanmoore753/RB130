def alternatingCharacters(s)
  duplicates = s.scan(/aa+|bb+/i)
  return 0 if duplicates.empty?
  duplicates.map { |str| str[1..-1].length }.reduce(:+)
end

a = "AAAABAAA"
b = "BBBBB"
p alternatingCharacters(a)