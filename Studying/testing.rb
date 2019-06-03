def test(&block)
  puts "What's &block? #{block}"
end

test { 'hi' }