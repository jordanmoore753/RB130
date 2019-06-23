=begin 

given an array of integers (scores)
round up or leave the number the same based on the following criteria

if the difference between the grade (int) and the NEXT
  multiple of 5 is less than 3, round the grade up!
if not, leave it the same

=end

def gradingStudents(grades)
  multiples_of_five = (0..100).step(5).to_a
  grades.map! do |grade|
    grade == 100 ? lowest_multiple = 100 : lowest_multiple = multiples_of_five.select { |i| i >= grade }.first
    lowest_multiple - grade <= 2 && lowest_multiple >= 40 ? lowest_multiple : grade
  end
end

a = [73, 67, 38, 33]
b = %w(36
6
98
25
97
24
25
70
50
71
30
14
28
100
3
26
61
98
50
41
5
3
28
34
0)
b.map!(&:to_i)
p b
p gradingStudents(b)
