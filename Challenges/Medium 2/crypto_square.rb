=begin 

so we use perfect squares for determining the row length

if we count up from 2

--

each_cons is gonna be perfect

each_cons(columns)
=end

class Crypto
  def initialize(str)
    @str = str
  end

  def normalize_plaintext
    arr = str.split('')

    until arr.all? { |char| char.match(/([a-zA-Z0-9])/) }
      arr.each { |char| char.gsub!(/([^a-zA-Z0-9])/, '~') }
      arr.delete('~')
    end

    @str = arr.join('').downcase
  end

  def size
    normalize_plaintext
    return 2 if str.length <= 2

    squares = (2..16).to_a.map { |num| num**2 }
    columns = 2

    squares.each do |num|
      break if str.length <= num
      columns += 1
    end

    columns
  end

  def plaintext_segments
    normalize_plaintext
    columns_length = size

    upper_idx = columns_length
    counter, result = 0, []

    until counter >= str.length - 1
      result << str[counter...upper_idx]
      counter += columns_length
      upper_idx += columns_length
    end

    result
  end

  def ciphertext
    str_arr = plaintext_segments
    result = []
    lower_idx, upper_idx = 0, size
    curr_sub_arr = 0

    
    str_arr.size.times do |counter|
      result << str_arr[counter].split('')
      break if counter == str_arr.size - 1
    end

    second_zip = result[1..str_arr.size - 1]
    result = result[0].zip(*second_zip).flatten.join('')
  end

  def normalize_ciphertext
    cipher_str, squares = ciphertext, (1..15).to_a.map { |n| n**2 }
    orig_str = ciphertext
    str_arr = plaintext_segments
    lower_idx = size - 1
    letters_remaining = 0
    square_idx = false
    new_size_inc = 0

    (size - 1).times do
      cipher_str.insert(lower_idx, ' ')
      letters_remaining = orig_str.length - lower_idx + 1 if square_idx == false

      if square_idx == true
        lower_idx += new_size_inc + 1
      elsif squares.include?(letters_remaining)
        square_idx = true
        new_size_inc = Integer.sqrt(letters_remaining)
        lower_idx += new_size_inc + 1
      else
        lower_idx += size 
      end
    end

    cipher_str
  end

  private

  attr_reader :str
end

crypto = Crypto.new('Madness, and then illumination.')
p crypto.normalize_ciphertext

crypto = Crypto.new('I am')
p crypto.size
p crypto.plaintext_segments
p crypto.normalize_ciphertext

p 16/5
# p crypto = Crypto.new('Time is an illusion. Lunchtime doubly so.')
# p crypto.ciphertext
# crypto = Crypto.new('Never vex thine heart with idle woes')
# p crypto.plaintext_segments

# a = 'Oh hey, this is nuts!'
# split_a = a.split('')
# counter = 0
# until split_a.all? { |b| b.match(/([a-zA-Z0-9])/) }
#   split_a.each { |b| b.gsub!(/([^a-zA-Z0-9])/, '~')}
#   split_a.delete('~')
# end

# p split_a
# b = 'Ifmanwasmeanttostayonthegroundgodwouldhavegivenusroots'
# p b.length

# a = ['a', 'b', 'c']
# b = ['d', 'e', 'f']
# p a.zip(b)
