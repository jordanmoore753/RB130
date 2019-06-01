=begin 

problem: depending on the decimal number, convert
to binary and return a series of strings based on
that number

binary:
1='wink'
10(2) ='double wink'
100(3) ='close your eyes'
1000(4) = 'jump'

if the number is 1, 10, 100, 1000 you can just put in the right
command

if it isnt exactly those, you need to go by place value
and multiply each one from the right an additional 10

so

[1, 1] (3)
1* 1**1, wink: 1 * 1**2 = 10, double wink

[1, 0, 0, 1, 1] - reverse because over 10000 - [ 1, 1, 0 ,0 ,1]
wink, double wink, zeros dont count so stop counting

[1,1,1,1,1]
wink, double wink, close your eyes, jump
reverse because over 10000

separate methods for now for determining the commands
commands for whole numbers different - make that now

method for determining non whole binary numbers
cannot go more than 4 times
map with index
starting from left, number * 1 ** idx

    if match_whole(num).nil?
      n = calc_place_value(num)
      issue_commands(n)
    else
      n = update_num(match_whole(num))
      [specific_command(n)]
    end

=end

class SecretHandshake
  def initialize(num)
    num = convert_str(num)
    @num = convert_to_bi(num)
  end

  def commands
    self.num = calc_place_value(num)
    issue_commands(num)
  end

  private

  attr_accessor :num

  def issue_commands(array)
    result = []

    array.each_with_index do |number, idx|
      result << gestures(number) if gestures(number).is_a? String
      break if idx == 3
    end

    five_digits?(array) ? reverse_results(result) : result
  end

  def convert_to_bi(number)
    return [] if number == []
    results = []

    until number == 0
      number, remainder = number.divmod(2)
      results << remainder
    end

    results
  end

  def gestures(result)
    case result
    when 1 then 'wink'
    when 10 then 'double blink'
    when 100 then 'close your eyes'
    when 1000 then 'jump'
    end
  end

  def calc_place_value(array)
    place_val = 0.1

    array.map do |n|
      place_val *= 10
      n * place_val.to_i
    end
  end

  def is_string?(input)
    input.instance_of?(String) ? true : false
  end

  def convert_str(var)
    if is_string?(var)
      var.to_i > 0 ? var.to_i : []
    else
      var
    end
  end

  def reverse_results(arr)
    arr.reverse
  end

  def five_digits?(arr)
    arr.size >= 5
  end
end

me = SecretHandshake.new(1)
p me
p me.commands
