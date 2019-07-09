=begin 

given an array of ints, starting from 1, cut
the integers that match the incrementing
number

1, 2, 3, 4, 3, 3, 2, 1 - cut 1
2, 3, 4, 3, 3, 2 - cut 2
3, 4, 3, 3, - cut 3
4 - cut 4
done

BEFORE you cut the next batch of integers,
print the current size of the ar array.

this can be done with until loop,
and the break condition being that
ar is empty.

have a counter variable starting at 0
print the size of the ar
increment the counter
delete all instances of counter from ar


=end

def cutTheSticks(arr)
  cut_int = 0
  result = []

  until arr.empty?
    result << arr.size
    cut_int += 1
    arr.reject! { |x| x == cut_int }
  end

  puts result.uniq
end

a = [5, 4, 4, 2, 2, 8]
cutTheSticks(a)
