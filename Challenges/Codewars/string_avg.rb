def average_string(s)
  return 'n/a' if s.empty?
  numbers = %w(zero one two three four 
               five six seven eight nine)
  values = (0..9).to_a
  words_to_nums = numbers.zip(values).to_h
  
  s.split(' ').map { |word| return 'n/a' if !numbers.include?(word) }
  
  result = s.split(' ').map { |word| words_to_nums[word] }.reduce(:+) / s.split(' ').size.floor
  
  words_to_nums.key(result)
end

p average_string("zero nine five two")