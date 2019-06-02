=begin 

problem: translate a word into pig latin

rules of pig latin:
1. if the word starts with vowel (aeiouy) then
and add 'ay' to end of word
2. if the word begins with a consonant, take the 
string of consonants until the first vowel and move them
to the end of the word then add 'ay'
3. qu counts as a consonant

vowels that count as vowel starts
[a e i o u y xr]

vowels that count as consonant slice stoppers
[ a e i o u y] EXCEPT if consonant is q
in which case it is
[a e i o y]

=end

class PigLatin
  VALID_QU = ['a', 'e', 'i', 'o', 'y']
  VALID_VOWELS = ['a', 'e', 'i', 'o', 'u', 'yt', 'xr']

  def self.translate(str)
    if str.include?(' ')
      str_arr = str.split(' ')
      arr_of_slices = str_arr.map do |word|
                        return_consonant(word)
                      end

      return_beginning_word(str_arr, arr_of_slices)
      combine_final_words(str_arr, arr_of_slices)
    elsif start_with_vowel?(str)
      str += 'ay'
    else
      consonant = return_consonant(str)
      produce_final_word(str, consonant)
    end
  end

  def self.start_with_vowel?(input)
    VALID_VOWELS.each { |char| return true if input.start_with?(char) }
    false
  end

  def self.return_consonant(input)
    counter = 0

    input.split('').each do |char|
      if input.start_with?('qu')
        break if VALID_QU.include?(char)
      else
        if char == 'u' && input[counter - 1] == 'q'
          counter += 1
          next
        end

        break if VALID_VOWELS.include?(char)
      end

      counter += 1
    end

    input.slice(0...counter)
  end

  def self.return_beginning_word(orig_words, slices)
    orig_words.map!.with_index { |word, idx| word.split('').slice(slices[idx].size..-1).join('') }
  end

  def self.combine_final_words(orig_words, slices)
    orig_words.map!.with_index { |word, idx| word += slices[idx] + 'ay' }.join(' ')
  end

  def self.produce_final_word(orig_str, cons)
    orig_str = orig_str.split('')
    orig_str.slice!(0...cons.size)
    orig_str.join('') + cons + 'ay'
  end
end
