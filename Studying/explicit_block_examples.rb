def go(&closure)
  puts "#{closure}"
end

moe = Proc.new { puts 'Go to Moes.' }

go { puts 'Go home'}

#

def explicit(mat, &blockington)
  mat.call
  expose(blockington)
end

def expose(arg)
  arg.call
end

yeah = Proc.new { puts 'Ys' }

explicit(yeah) { puts 'Yes '}