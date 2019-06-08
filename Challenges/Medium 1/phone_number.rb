=begin 

create a program that:
cleans up user-entered phone numbers (string)

by clean, it means:
- eliminate any non-integer characters
- remove leading 1 if there are 11 numbers
- verify that it is an actual phone number
  - if it has 11 numbers, it only passes if the leading
    number is 1
  - otherwise, it's invalid if it has 11 or more numbers
  - if it has 10 digits, it's good 
  - if it's a bad number, convert to ten 0's (string)

the output should be a string of ten numbers
- if a good number, return the number as string
- if bad number, return '0000000000'

data structure:

number method

--- 

have an instance variable: valid?
that tracks the boolean evaluation of whether or not
the phone number is valid. If it ever goes to false,
then it is false permanently.

check if string is valid. doesn't have any letters, it's good
to go to the next step.

first, check if string has any letters. if it does, it's invalid.

use scan for determining the count of number characters
in the string
use the return value for the @input variable
check if the string has 11 characters and starts with a
1,
if it does, shift the first character and join

if it is 11 or more and doesn't start with 1,
assign the value of valid? to false

if it is 10, then just join the array.

---

area_code method

---
use the number method to construct the correct phone number
return the first three characters of the number

---

to_s
---
returns the actual phone number (716) 876-3234 as a string
invoke the number method
change the @number to an array with chars
slice the number into three separate variables
1. is area_code
2. first 3 numbers of the last 7
3. last 4 numbers of the last 7

prepend and append ( and ), and a ' ' to the area_code var
append an '-' to the three numbers

join the array
---

=end

class PhoneNumber
  INVALID_NUMBER = '0000000000'
  attr_accessor :phone_number, :valid

  def initialize(number)
    @phone_number = number
    @valid = true
  end

  def number
    contains_letters?
    validate_numbers

    valid ? phone_number : INVALID_NUMBER
  end

  def area_code
    number.chars[0..2].join
  end

  def to_s
    number 
    modify_phone_number
  end

  def contains_letters?
    self.valid = false if phone_number.scan(/[a-zA-Z]/).count >= 1
  end

  def validate_numbers
    chars_array = phone_number.scan(/[0-9]/)
    
    if chars_array.count == 11 && chars_array.first == '1' || chars_array.size == 10
      chars_array.count == 10 ? chars_array : chars_array.shift
    else
      self.valid = false
    end

    self.phone_number = chars_array.join  
  end

  def modify_phone_number
    self.phone_number.insert(3, ') ')
    self.phone_number.insert(8, '-')
    self.phone_number.prepend('(')
  end
end

# me = PhoneNumber.new('1234567890')
# p me.number
# p me
# p me.area_code
# puts me

