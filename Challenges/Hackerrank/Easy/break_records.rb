=begin 

a college bb player keeps a record of her play
she records the amount of times she breaks her
highest and lowest points per game records.

the first time she plays, the score of her game
is set for both the minimum and maximum points.

so if she scores 16 in first, the score to beat for min
and max is 16.

in a separate array, she keeps track of how many times her
records are beaten. each time she changes one of the max or
min records, she adds 1 to the first element (min) or second
element (max).

she returns this array at the end of the program.

the first number in the input array is the first min
and max record.

iterate through the array, if the curr value is less than
lowest value arr[0] then change the arr[0] to curr value
AND increment the first value of the return array

same for if it's larger (arr[1] instead of arr[0])

return array of times the scores changed
=end

a = [10, 5, 20, 20, 4, 5, 2, 25, 1]
b = %w(3 4 21 36 10 28 35 5 24 42).map(&:to_i)
def breakingRecords(scores)
  record_changes, min_max = [0, 0], [scores.first, scores.first]
  scores.each do |score|
    if score < min_max.first
      record_changes[1] += 1
      min_max[0] = score
    elsif score > min_max.last
      record_changes[0] += 1
      min_max[1] = score
    end
  end

  record_changes
end

p breakingRecords(a)
p breakingRecords(b)