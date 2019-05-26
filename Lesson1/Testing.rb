def test2(block)
  puts 'hello from test2'
  block.call
  puts 'goodbye from test2'
end

def test(&block)
  puts 'first in test'
  test2(block)
  puts 'second in test'
end

test { puts 'test block' }