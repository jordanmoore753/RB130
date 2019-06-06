items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*items, item|
  puts items.join(' ')
  puts item
end

gather(items) do |first, *items, item|
  puts first
  puts items.join(' ')
  puts item
end

gather(items) do |item, *items|
  puts item
  puts items.join(' ')
end

gather(items) do |one, two, three, four|
  puts [one, two, three + ',', 'and ' + four].join(' ')
end

