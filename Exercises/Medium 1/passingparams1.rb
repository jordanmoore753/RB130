items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(item)
  puts "Let's start gathering food."
  msg = yield(item) if block_given?
  puts msg if !msg.nil?
  puts "Nice selection of food we have gathered!"
end

gather(items) { "We've got: #{items.join(', ')}. This sucks!" }