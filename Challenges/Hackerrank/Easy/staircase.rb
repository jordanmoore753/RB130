def staircase(n)
  (1..n).to_a.each do |i|
    spaces = ' ' * (n - i)
    puts "#{spaces}" + "#" * i
  end
end

staircase(6)