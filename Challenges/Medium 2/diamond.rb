=begin 

construct a diamond based on the letter passed
as an argument

  A
 B B
  A

the number of rows appears to be the same
as if the letters of the alphabet were put
into an array

a = 0, b = 1, c = 2

and the spaces between the letters within 
a row starts at 1 and increments by 2
every time you proceed up an index value

it decrements by 2 every time you
decrease one index value

The total space in a row is determined
by the input letter

if the input is E, for example, the space
covered for each row must be 9. 
2 spaces for the letters E, and 7 spaces
of whitespace. For the letter A,
there will be one A and 4 whitespace on either
side.

For the letter B, there will be two B's,
one whitespace between the B's, and 3 whitespace
on either side of B

For the letter C, there will be 2 c's,
three whitespace between the c's, and 2 whitespace 
on either side of c

index 0 (A) is an exception and only prints
one A in addition to the amount of whitespace necessary

The first row really calculates every other row
by setting up the outside spaces

if E is input, that means index is 4, so that means
that the #whitespace variable starts at 4
and decrements with each row. 

Then, when the array is done being iterated over
one time, so the diamond is halfway completed,
the spaces is incremented by 1.

The final element of the array is popped. The array
is reversed. We iterate again, printing the 

"#{whitespace}#{letter}#{middle_space}#{letter}#{middle_space"
again for each element of the array.

A is again an exception here and will print out
#{whitespace}#{letter}#{whitespace}

whitespace = ' '
whitespace_number = ' ' * array.index(E)
middle_space = ''
array.uniq!

[a, b, c, d, e].each do |char|
  if char is A
    output whitespaces, A, whitespaces
  else
    white = white.chop
    middle_space += ' '
    puts whitespaces, letter, middle spac, letter, whtiespace
  end
end

next array is 

[d, c, b, a].each do |char|
  if char is A
    whitespaces += ' '
    output whitespaces, a, whitespaces
  else
    whitespaces += ' '
    middle_space = middle_space.chop
    output whitespac, letter, middle, letter, whitesp
  end
end
=end

class Diamond
  def self.make_diamond(letter)
    letter == 'A' ? str_array = ['A'] : str_array = ('A'..letter).to_a
    str_array += str_array.slice(0...-1).reverse

    str_array.map do |char|
      if char == 'A'
        "#{side_space(char, letter)}#{char}#{side_space(char, letter)}\n"
      else 
        "#{side_space(char, letter)}#{char}#{middle_space(char)}#{char}#{side_space(char, letter)}\n"
      end
    end.join('')
  end

  def self.side_space(curr_ele, peak_char)
    ' ' * (peak_char.ord - curr_ele.ord)
  end

  def self.middle_space(curr_ele)
    return '' if curr_ele == 'A'
    return ' ' if curr_ele == 'B'
    ' ' * ((curr_ele.ord - 'B'.ord) * 2 + 1)
  end
end

