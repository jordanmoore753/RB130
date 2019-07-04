def gameOfThrones(s)
  zeros = []
  26.times { zeros << 0 }
  characters = ('a'..'z').to_a.zip(zeros).to_h

  s.chars.each { |char| characters[char] += 1 }

  frequencies_odd = characters.values.select(&:odd?)
  frequencies_even = characters.values.select(&:even?)

  frequencies_odd.size == 1 || frequencies_even.size == 26 ? 'YES' : 'NO'
end

a = "aaabbbb"
p gameOfThrones(a)

