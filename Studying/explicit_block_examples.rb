def go(&closure)
  puts "#{closure}"
end

moe = Proc.new { puts 'Go to Moes.' }

go { puts 'Go home'}

#

