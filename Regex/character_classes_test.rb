def my_method(&block)
  block.call
end

my_method { puts "yeah".upcase }

##

def another_method(explicit_block)
  explicit_block.call
end

ex_block = Proc.new { puts "Nooooo".downcase }

another_method(ex_block)

p("Hello") do
  p "Goodbye"
end