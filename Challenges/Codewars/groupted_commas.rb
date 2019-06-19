=begin 

given an integer in the form of
a string, figure out how many
commas are necessary and then output
that new string with commas
inserted

the total number of characters / 4 (number of characters 
necessary for a comma) is equal to the number

insert a comma at each index from the right that
corresponds to the fourth spot away from the start point

have a new array and index 
if index % 3 (index is 1 less than actual number 4)
then add a , number



=end

def solution(n)
  n = n.to_s
  (n.size % 3).zero? ? commas_amount = n.size / 3 - 1 : commas_amount = n.size / 3
  n.reverse.chars.map.with_index do |char, idx|
    if commas_amount.zero?
      char
    elsif (idx % 3).zero? && idx > 1
      commas_amount -= 1
      ",#{char}"
    else
      char
    end
  end.join('').reverse
end

p solution('1234567990')
p solution('123456')
p -3 % 3