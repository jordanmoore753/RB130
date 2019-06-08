# str = 'What is -12 divided by 2 divided by -3?'
# str.delete!('?')
# arr = []

# str.split(' ').each { |word| arr << word if word.match(/minus|plus|multiplied|divided|[0-9]/) }
# p arr

# curr_total = 0
# numbers = []

# arr.each_with_index do |ele, idx|
#   if ele.to_i > 0 || ele.to_i < 0
#     numbers << ele.to_i
#   else
#     numbers << arr[idx + 1].to_i
#     arr.delete_at(idx + 1)
#     curr_total = numbers.reduce(:-) if ele.match(/minus/)
#     curr_total = numbers.reduce(:+) if ele.match(/plus/)
#     curr_total = numbers.reduce(:*) if ele.match(/multiplied/)
#     curr_total = numbers.reduce(:/) if ele.match(/divided/)    
#     numbers = [curr_total]
#   end
# end

# p curr_total

# p [5, 2].reduce(:/)

=begin 

I've got the spike done. Now, I just need to write some pseudocode
and figure out how to structure this thing nicely.

The calculation seems to be a case statement that is its own
  method that takes two arguments, the array and the element.
  The element is the word minus, the array holds the numbers.

Right when the object is instanitated, re-assign the string. Delete
any ?.

Then, we need to get rid of every word that does not match:
plus, minus, multiplied, divided, or a number.

data:
@str

methods:
modify_input_string
answer
calculate

=end

class WordProblem
  attr_reader :str_array

  def initialize(str)
    @str_array = modify_input_string(str)
  end

  def modify_input_string(string)
    string.delete!('?')
    arr = []

    string.split(' ').each do |word| 
      arr << word if word.match(/minus|plus|multiplied|divided|[0-9]/)
    end

    arr.map { |element| element.match(/[0-9]/) ? element.to_i : element }
  end

  def calculate(arr, operation)
    case operation
    when 'minus' then arr.reduce(:-)
    when 'multiplied' then arr.reduce(:*)
    when 'divided' then arr.reduce(:/)
    when 'plus' then arr.reduce(:+)
    end
  end

  def answer
    error?
    curr_total = 0
    numbers = []

    str_array.each_with_index do |ele, idx|
      if ele.is_a? Integer
        numbers << ele
      else
        numbers << str_array[idx + 1]
        str_array.delete_at(idx + 1)
        curr_total = calculate(numbers, ele) 
        numbers = [curr_total]
      end
    end

    curr_total
  end

  def error?
    raise ArgumentError if str_array.empty? || str_array.all? { |word| word.is_a?(Integer) }
  end
end

# me = WordProblem.new('What is 54 cubed?')
# p me.answer