=begin 

find out the lowest amount of change
necessary to meet a certain input

so if we get loose_change(56)
=> nickels: 1, pennies: 1, dimes: 0, quarters: 1

sort the numbers into a hash that gets
returned as the final value

use divmod, starting with 25, 10, 5, 1
to get the correct amounts of each

have an array with cent values
iterate through them with the total amount
being updated each divmod invocation

the remainder is the new amount, 
the dividend gets added to a hash

if the index of arr is0, add to quarters,
  1, add to dimes
  2, add to nickels
  3, add to pennies

return hash


=end

def loose_change(cents)
  change = {'Pennies' => 0, 'Nickels' => 0, 'Dimes' => 0, 'Quarters' => 0 }
  return change if cents <= 0
  cent_values = [25, 10, 5, 1]

  cent_values.each_with_index do |value, idx|
    amount, cents = cents.divmod(value)
    change[update_hash(idx)] = amount
  end

  change
end

def update_hash(index)
  case index
  when 0 then 'Quarters'
  when 1 then 'Dimes'
  when 2 then 'Nickels'
  when 3 then 'Pennies'
  end
end

p loose_change(29)
