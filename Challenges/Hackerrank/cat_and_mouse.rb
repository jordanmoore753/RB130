=begin 

x = cat a position
y = cat b position
z = mouse position

whichever x or y is smaller when subtracted from z is the answer
if x is smaller, pritn cat a
	is y is smaller print cat b
	if neither is mouse c

=end

def catAndMouse(x, y, z)
	x = (x - z).abs
	y = (y - z).abs

	case 
	when x == y then "Mouse C"
	when x < y then "Cat A"
	else 
		"Cat B"
	end
end

catAndMouse(1, 2, 3)
catAndMouse(1, 3, 2)

p 76484.to_f / 2325037.to_f