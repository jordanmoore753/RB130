# method with explicit block

def compute(&block)
  if block_given?
    yield(block)
  else
    return 'Does not compute.'
  end
end

# or implicit block

def compute
  return 'Does not compute.' unless block_given?
  yield
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'