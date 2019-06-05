=begin 

create a program that can ouput the day
that a certain meeting should take place

givens:
class named meetup
  takes constructor arguments (month, year)
method for each day of the week (:monday)
method for each week of the month (:first, :second, :teenth,:fourth, :third, :last)

essentially, this program is outputting which day of 
the month it will be (2013, 5, 13) that meets the criteria
for the day method (day of week, type of day)

the :monday can just be a string converted I don't think the days
need their own method

The :first - :last can correspond to a certain number of days.
Like 1-7 can be first, 8-15 can be second, 16-23 third, 23-30 last

or just divide the days in month / 4 and split it equally.
Then any day that starts with 1 and ends with 3-9 counts as teenth.

cwday returns the day of calendar week: 1 is always monday, 7 always
sunday

convert the day of week into its number: 1 == monday, 7 == sunday
then select from array of possible dates (13-19 for teenth) for the value
that == the day of week converted (friday == 5)

theres your day of the week

--- determining which portion of the month for each second argument


=end

require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
    @days_per_month = [0, 31, 28, 31, 
                       30, 31, 30, 31, 
                       31, 30, 31, 30, 
                       31 ]
  end

  def day(weekday, week)
    days_array = compute_days_per_week(week)
    weekday = convert_day_into_number(weekday)

    correct_day = days_array.select do |day|
                    Date.new(year, month, day).cwday == weekday
                  end.join.to_i
  
    Date.new(year, month, correct_day)
  end

  def compute_days_per_week(string)
    case string.to_s
    when 'first' then (1..7).to_a
    when 'second' then (8..14).to_a
    when 'third' then (15..21).to_a
    when 'fourth' then (22..28).to_a
    when 'teenth' then (13..19).to_a
    when 'last' then (days_per_month[month] - 6..days_per_month[month]).to_a
    end
  end

  def convert_day_into_number(string)
    case string.to_s
    when 'monday' then 1
    when 'tuesday' then 2
    when 'wednesday' then 3
    when 'thursday' then 4
    when 'friday' then 5
    when 'saturday' then 6
    when 'sunday' then 7
    end
  end

  private

  attr_reader :month, :days_per_month, :year
end
