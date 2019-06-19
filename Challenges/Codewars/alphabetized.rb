def alphabetized(s)
  s.gsub!(/[^a-zA-Z]/, '')
  return s if s.length == 1
  one, two = [], []
  s.chars.map { |i| one << i if i.match(/[^a-z]/) }
  s.chars.map { |i| two << i if i.match(/[a-z]/) }
  one.sort!
  two.sort!
  result = []
  counter = 0

  until result.size == one.size + two.size
    result << one[counter]
    result << two[counter]
    counter += 1
  end

  result.join('')
end

p alphabetized('Holy Bible Boy')
p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z")