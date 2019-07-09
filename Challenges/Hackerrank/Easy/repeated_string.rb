=begin 

given a string, repeat it until its length is equal to
n. then, print the number of a's in the new string.

append the string to itself until the length is greater
than or equal to n

then, use count on the string but only between index of 0..9

return that number

count all the a's in the original string
count everything else in the string that isn't an a

divide n by everything

=end

def repeatedString(s, n)
  div = n / s.length
  mod = n % s.length
  a_count = s.count('a')
  a_count * div + s[0...mod].count('a')
end

a = 'aba'
b = 10
c = 882787
d = "aab"
e = "kmretasscityylpdhuwjirnqimlkcgxubxmsxpypgzxtenweirknjtasxtvxemtwxuarabssvqdnktqadhyktagjxoanknhgilnm"
f = 736778906400
g = "gfcaaaecbg"
h = 547602
#answer = 164280
p repeatedString(a, b)
p repeatedString(d, c)
p repeatedString(e, f)
p repeatedString(g, h)