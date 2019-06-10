=begin
create a program that given a string
can output the string converted with
an atbash cipher

the atbash cipher converts each letter
according to index number in alphabet:

1 => 26
2 => 25
3 => 24
a => z
b => y
c => x
and vice-versa

we can do this by having two separate arrays
one with the alphabet as normal order,
one with the alphabet in reverse

when we iterate over a string's characters,
we replace the curr letter with the curr
index equivalent in the reverse array

as evidenced by this example:

'nrmwy oldrm tob', Atbash.encode('mindblowingly')

the maximum that a single stretch of characters can
be before a space is 5. This means that when the index
is a multiple of 5 (not 1) then append a space
to the results string.

all letters must be downcased.
all whitespace and punctuation must be removed.
numbers stay the same and are included in
the output.

This is a class and class method.
=end

class Atbash
  ALPHABET_NORMAL = ('a'..'z').to_a
  ALPHABET_REVERSE = ALPHABET_NORMAL.reverse

  def self.encode(string)
    results = ''
    modified_string = string.downcase
    modified_string.gsub!(/[^a-z0-9]+/, '') if string.match(/[^a-z0-9]+/)

    modified_string.chars.each_with_index do |char, idx|
      results += ' ' if idx % 5 == 0 && idx > 1
      if ALPHABET_NORMAL.include?(char)
        curr_char_idx = ALPHABET_NORMAL.index(char)
        char = ALPHABET_REVERSE[curr_char_idx]
      end
      results += char
    end
    results
  end
end
