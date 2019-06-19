=begin 

given a string of words, return
the string with all words with length
4 or greater (l > 3) as abbreviated

Abbreviated means:
for the number of letters between the
  first character and last character
substitute all of the characters between
the first and last
with the number of characters it is 
replacing

elephant => e6t 

NO SPLITTING STRINGS
too complicated, can't account for all punctuation

we're gonna scan the string for words 
select from that array of scanned words
only the words that are greater than 3
in length

then, we need to iterate over the array of remaining words
take the word and subtract its length - 2 and assign it a
variable
return word[0] + variable.to_s + word[-1]

sp = /[[:punct:]]|\s/
o = 'You, and I, s4d s3k.'

p x = o.scan(/\w+/).select { |word| word.length > 3 }
=end

class Abbreviator
  def self.abbreviate(string)
    words = string.scan(/\w+/).select { |word| word.length > 3 }
    words.each do |word|
      abbreviation = (word.length - 2).to_s
      string.gsub!(word, word[0] + abbreviation + word[-1])
    end

    string
  end
end

p Abbreviator.abbreviate('double-barrel')
