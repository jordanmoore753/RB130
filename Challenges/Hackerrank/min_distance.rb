=begin 

for all matching values in a given array,
	print the distance between matching values
	print the LOWEST distance

if no matching values exist, print -1
	or, if no minimum, print -1

for each element in the given array
iterate through its index to the end of the array
and if it finds a matching value

subtract the first element's index from
second element's index + first element's index
append it to a results array
break

move on to next element

return smallest number from results array

=end

def minimumDistances(a)
	return -1 if a.uniq == a
	results = []

	a.each_with_index do |ele, idx|
		a[idx + 1..-1].each_with_index do |second, sec_idx|
			if second == ele
				results << sec_idx + idx - idx + 1
				break
			end
		end
	end

	results.min
end

p minimumDistances([7, 1, 3, 4, 1, 7])