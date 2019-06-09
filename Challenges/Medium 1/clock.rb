=begin 

problem: use a class and class methods to
determine the time given an integer or two

first integer is hours, second is minutes

two methods: 
at(hour, minute)
.to_s

the return value of at(hour, minute) will be
an integer, since we should be able to subtract
and add to it.

05:30 => 330 (minutes)

the return value of to_s should be a string
with single digit numbers given a leading
zero.

'05:30'

at(hours, minutes)
--
all we need to do here is:
  1. convert both inputs to minutes
  2. sum them

define a constant named hours_per_day
and minutes_per_hour and minutes_per_day.
These will be used all through your program.

if the hour is 0, change it to 24. Otherise,
  leave the value the same.

convert the hours into minutes by multiplying
the input for hour by 60. 

then, add the hour and minutes.

to_s
----
the calling object will be an integer
representing minutes. so we need to run divmod
on the minutes, using the total amount of minutes
within a day.

invoke divmod on the total minutes divmod (total minutes per day)

the div will be the hour, and the mod will be minutes

to format them, use "%02d" + hours and vice versa in order
to ensure there is single digits

=end

# first version: 

# class Clock
#   def self.at(hour = 0, minutes = 0)
#     hour = 24 if hour.zero?
#     (60 * hour) + minutes
#   end
# end

# class Integer
#   def to_s
#     hours, minutes = self.divmod(60)
#     hours = hours % 24 if hours >= 24 
#     "#{format('%02d', hours)}:#{format('%02d', minutes)}"
#   end
# end

# refactored:

class Clock
  def initialize(hour, minutes)
    hour = 24 if hour.zero?
    self.total_minutes = (60 * hour) + minutes
  end

  def self.at(hour = 0, minutes = 0)
    Clock.new(hour, minutes)
  end

  def -(int)
    @total_minutes -= int
    self
  end

  def +(int)
    @total_minutes += int
    self
  end

  def ==(other_obj)
    self.to_s == other_obj.to_s
  end

  def to_s
    hours, minutes = total_minutes.divmod(60)
    hours = hours % 24 if hours >= 24 
    "#{format('%02d', hours)}:#{format('%02d', minutes)}"
  end

  private

  attr_accessor :total_minutes
end

# me = Clock.at() + 190
# puts me.to_s
# # me = Clock.at(0, 35) - 60
# # me.to_s
# p 25%24

