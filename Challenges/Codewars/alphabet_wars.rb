=begin 

strings may contain #, [ ]
# represents nuclear bomb
[] is a bomb shelter

if there is only 1 bomb leading to a shelter
  it is safe ( n <= 1) (the letters inside [] are returned)
if there are 2 or more, ( n >= 2), then the
  shelter is blown up. (the letters inside qualifying [] are returned)
if there is 1 leading to the shelter and 1 # 
  after the shelter, the shelter in between is blown up
(remaining unaffected shelter is returned)

if there are no bombs, everyone survives
  (all letters are returned)


=end

string = 'abde[fgh]ijk[wed]er'
# string.chars.keep_if { |c| c.match(/(\[(.*?)\])/) || c == '#'}
# yes = string.match(/(\[(.*?)\])|\#/)
# p yes
in_bomb_shelter = false
explosives = 0
p string.chars.select { |c| c != '[' || c != ']' }.join 
n = string.chars.map do |char|
  if char == '#'
    explosives += 1
    char
  elsif char == ']'
    in_bomb_shelter = false
    char
  elsif char == '['
    in_bomb_shelter = true
    char
  elsif in_bomb_shelter
    char
  else
    ''
  end
end.select { |c| c != '' }

p n