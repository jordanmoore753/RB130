=begin 

tortoise: 720 feet per hour
hare: 850 feet per hour

tortoise has 70 foot lead

t = time

70 + 720(t) = 850(t)

70 = 130(t)

70/130

p -70.0/(720.0-850.0) 

formula is:

-distance_covered / (rate_a - rate_b)
then convert that into seconds from hours, then do
divmod on each unit (3600, 60)
add each remainder to an array
hours, minutes, seconds
round down

p a = -70.0/(720.0-850.0) * 3600
b,c = a.divmod(3600)
p b
d, e = c.divmod(60)
p d, e

=end

def race(v1, v2, g)
  units = [3600, 60]
  seconds_to_meet = -g.to_f / (v1.to_f - v2.to_f) * 3600

  units.map do |unit|
    div, seconds_to_meet = seconds_to_meet.divmod(unit)
    unit == 60 ? [div.floor, seconds_to_meet.floor] : [div.floor]
  end.flatten
end

p race(720, 850, 70)

