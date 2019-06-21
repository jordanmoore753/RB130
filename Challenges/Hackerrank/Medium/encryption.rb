=begin 

encrypt a string by removing all spaces
counting the characters
finding sqrt of character count
then set rows and columns by:
floor, ceil

p Math.sqrt(54).floor
a = 'chillout'
b = a.chars.each_slice(3).to_a
b.map! do |i|
  i.join
end 

p b.join(' ')

the ceil will be the number that goes for
each_slice argument

join the contents of each subarray
then join the arrays with ' ' to return the string

=end

def encryption(s)
  s.gsub!(' ', '')
  rows, columns = Math.sqrt(s.length).floor, Math.sqrt(s.length).ceil
  rows += 1 if rows * columns < s.length
  result, slices = Array.new(columns) {[]}, s.chars.each_slice(columns).to_a
  slices.each { |sub| sub.each_with_index { |num, idx| result[idx] << num } }
  result.map { |sub| sub.join }.join(' ')
end

p encryption('chillout')
p encryption('feedthedog')
p encryption('haveaniceday')
