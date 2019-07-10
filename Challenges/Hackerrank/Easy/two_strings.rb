=begin 

find out if a pair of words have common substrings

calculate all substrings for each word
find if any of them are the same

to make the substrings

have two counters
one is tracking the current letter
one is tracking the starting letter

two until loops
each runs until the counter == length of string

starting letter loop is parent loop to current letter loop
once current letter reaches length of string,
break and increment starting letter by 1 and set
current letter = starting letter

=end

def twoStrings(s1, s2)
  first, second = s1.chars.uniq, s2.chars.uniq
  #first, second = substrings(s1), substrings(s2)
  bool = first.any? { |substring| second.include?(substring) }
  bool ? 'YES' : 'NO'
end 

def substrings(string)
  start_counter, letter_counter = 0, 0
  results = []

  until start_counter == string.length
    until letter_counter == string.length
      results << string[start_counter..letter_counter]
      letter_counter += 1
    end

    start_counter += 1
    letter_counter = start_counter
  end

  results
end

p twoStrings('hello', 'world')