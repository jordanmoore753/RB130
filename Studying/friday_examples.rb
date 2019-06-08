# Two examples of explicit passing

a = Proc.new { puts 'yeah' }

def echo(var)
  var.call
end

echo(a)

#

def pap(&block)
  block.call
end

pap { puts 'ggo ho' }

# Two examples of implicit passing

c = [1, 2, 3]

c.select! { |n| n.even? }

c

# 

d = [1, 5, 3, 6]

d.sort! do |a, b|
  b <=> a
end

p d

#

def echo(param)
  #some code
  yield(param) if block_given?
end

echo('death') { |name| puts name }

#

ted = Proc.new { puts 'woah!' }

def woah(proc)
  proc.call
end

woah(ted)

# 

def yess(&block)
  block.call
end

yess { puts 'french fries' }

# 

i = [2, 3, 6].select(&:even?)
p i

# 

def my_method
  yield(3)
end

oo = my_method { |i| i.to_s }
p oo





