=begin 

create a method any? that behaves exactly like any?
and takes a block

=end

def any?(arr)
  arr.each do |element| 
    if block_given?
      return true if yield(element)
    end
  end

  false 
end


p any?([1, 3, 5, 7]) { |value| value.even? } 
p any?([2, 4, 6, 8]) { |value| value.odd? } 
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } 
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false