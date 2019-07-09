=begin 

convert two integers (5 and 00) into the correct
time in words

5:00 => five o clock

if the minutes is less than 30, compute the minutes
  by adding the minutes to 0
if minutes greater than 30, compute minutes by
  subtracting minutes from 60

if 00, 45, 30, 15, special return value

time TO next hour if more than 30 minutes
time PAST given hour if less than 30 minutes

quarter = 15 or 45
half = 30

only need a hash with numbers 1-29

if 0 == o' clock

=end

def timeInWords(h, m)
  num_and_word = { 1 => 'one', 2 => 'two', 3 => 'three',
                     4 => 'four', 5 => 'five', 6 => 'six',
                     7 => 'seven', 8 => 'eight', 9 => 'nine',
                     10 => 'ten', 11 => 'eleven', 12 => 'twelve',
                     13 => 'thirteen', 14 => 'fourteen', 15 => 'quarter',
                     16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen',
                     19 => 'nineteen', 20 => 'twenty', 21 => 'twenty one',
                     22 => 'twenty two', 23 => 'twenty three', 24 => 'twenty four', 
                     25 => 'twenty five', 26 => 'twenty six', 27 => 'twenty seven', 
                     28 => 'twenty eight', 29 => 'twenty nine', 30 => 'half',
                     0 => "o' clock" }

  if m.zero?
    h, m = num_and_word[h], num_and_word[m]
    return [h, m].join(' ')
  end

  h = num_and_word[compute_hour(h, m)]
  minutes = num_and_word[compute_min(m)]
  joiner = create_joiner(m)
  [minutes, joiner, h].join(' ')
end

def compute_min(min)
  min < 31 ? min : 60 - min
end

def create_joiner(min)
  case 
  when min == 15 || min == 30 then "past"
  when min == 45 then "to"
  when min == 1 then "minute past"
  when min == 59 then "minute to"
  when min < 30 then "minutes past"
  when min > 30 then "minutes to"
  end
end

def compute_hour(hour, min)
  min < 31 ? hour : hour + 1
end

p timeInWords(7, 29)
p 4 / 3