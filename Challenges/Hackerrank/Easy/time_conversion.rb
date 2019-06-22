=begin 

given a string with a 12-hour formatted time with AM/PM,
convert it to 24 hour military time

since we're given minutes and seconds, we don't need to
convert them.

We can just convert the hour.

If it's AM, subtract from 12, if its PM add to 12

Then, give the result a leading zero.

gsub it into the original string

capture the first two characters in var start
if last two characters are PM, night? true, else false
if night? start var + 12
  else 12 - start_var

"%01d" % 5 => 05
=end

def timeConversion(s)
  hour = s[0..1]
  s[-2..-1] == 'PM' ? night = true : night = false
  return s[0..7] if night && hour == '12'
  return s[0..7].gsub(hour, '00') if !night && hour == '12'

  night ? mod_hour = "%02d" % (12 + hour.to_i) : mod_hour = "%02d" % (0 + hour.to_i)
  s[0..7].gsub!(hour, mod_hour) 
end

p timeConversion("07:05:45PM")
p timeConversion("12:05:39AM")
p timeConversion("12:45:54PM")