a = 7

def josephus(items, k)
  items = (1..items).to_a
  Array.new(items.length) { items.rotate!(k - 1).shift }.last
end

p josephus(7, 3)
