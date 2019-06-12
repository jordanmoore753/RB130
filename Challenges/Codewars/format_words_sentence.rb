=begin 

separate the words in an array into a 
single comma separated list
if there are two elements, no comma, just join with and
if there are more than two elements, join the whole batch
  up to the last element
join the last element with and

slice will work well for this




=end


def format_words(words)
  return '' if words.empty?
  words.delete('') if words.include?('')
  
  if words.size > 2
    words.slice(0, words.size - 1).join(', ') + ' and ' + words[-1]
  elsif words.size == 2
    words.join(' and ')
  else
    words.join
  end
end 

p format_words(['ninja', '', 'word', 'yeah'])