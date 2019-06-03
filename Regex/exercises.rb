def is_K?(str)
  str.match(/K/) ? true : false
end

def is_h_H?(str)
  str.match(/h/i) ? true : false
end

def is_dragon?(str)
  str.match(/dragon/) ? true : false
end

def has_fruit?(str)
  str.match(/(apple|orange|banana|strawberry)/) ? true : false
end

def comma_or_space?(str)
  str.match(/( |,)/) ? true : false
end

def blue_or_black?(str)
  str.match(/(blue|black)berry/) ? true : false
end

p blue_or_black?('black berry')

strin = 'a1 a2 a3 b1 b2 b3 c1 c2 c3 d1 d2 d3'
