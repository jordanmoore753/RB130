def XO(str)
  str.downcase.count('x') == str.downcase.count('o')
end

p XO('xxoo')