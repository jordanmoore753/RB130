=begin 

create a cipher
turn each letter into the letter
13 characters after it

upper and lowers are included
case sensitive

can ord be used?

create two arrays, one with lowercase alhpa, uppercase alpha
iterate through chars of input
if the letter is included in either then substitute
use index of current char to get index of one 13 away

=end

def rot13(string)
  lowers, uppers = ('a'..'z').to_a + ('a'..'z').to_a, ('A'..'Z').to_a + ('A'..'Z').to_a
  string.chars.map do |char|
    if lowers.include?(char)
      lowers[lowers.index(char) + 13]
    elsif uppers.include?(char)
      uppers[uppers.index(char) + 13]
    else
      char
    end
  end.join
end

p rot13('test')