=begin 

create a program that stores students' names and the
grade they are in

objects : school

functions: 
1. add a students name to the roster for a certain grade
ex: school.add('Jim', 2) 2 is the grade, jim is the name.

2. create a list of all students enrolled in a grade
ex: {2=> ['Jim', 'Peter']}

3. Get a sorted list of all students in ALL grades. Sort grades 
by ascending order and sort the students by name in ascending
order.
ex: {1=> ['Aimee', 'zayne'], 2=> ['Jim', 'Peter']}

We need to create a School class. 
We need the instance methods:
add(name, grade)
to_h => shows all students in all grades
grade(grade level) => shows all students in the argument's 
grade level

exceptions:
non existant grade get attempt results in an empty array

to_h must also sort the grades from lowest to highest
grade levels MUST be the keys in the hash

=end

class School
  def initialize
    @roster = {}
  end

  def add(name, grade)
    roster.has_key?(grade) ? roster[grade] << name : roster[grade] = [name]
  end

  def to_h
    roster.sort.each { |sub_arr| sub_arr[1].sort! }.to_h
  end

  def grade(grade_level)
    roster.has_key?(grade_level) ? roster[grade_level] : []
  end

  private

  attr_reader :roster
end

# school = School.new
#     [
#       ['Jennifer', 4], ['Kareem', 6],
#       ['Christopher', 4], ['Kyle', 3]
#     ].each do |name, grade|
#       school.add(name, grade)
#     end
#     p school.to_h