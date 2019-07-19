=begin 

given two strings, find out how many letters you need to delete
to make them have all the same letters

find the MINIMUM amount of deletions

an anagram is a word that has all of the same letters and frequencies
of each letter as another word



=end

def makingAnagrams(s1, s2)
  result, used_letters = 0, []

  s2.chars.uniq.each do |char|
    used_letters << char
    result += (s1.count(char) - s2.count(char)).abs
  end

  s1.chars.uniq.each do |char|
    next if used_letters.include?(char)
    used_letters << char
    result += (s1.count(char) - s2.count(char)).abs
  end
  
  result
end

a = "absdjkvuahdakejfnfauhdsaavasdlkj"
b = "djfladfhiawasdkjvalskufhafablsdkashlahdfa"
p makingAnagrams(a, b)
p makingAnagrams('cde', 'abc')
