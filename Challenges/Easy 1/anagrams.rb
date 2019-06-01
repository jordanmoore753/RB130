=begin 

problem: given a string and a list of other strings
return a list of the strings that are anagrams

anagrams are words that all have the same letters

listen == silent

essentially, we can sort one array of characters and another
and if they have the same order of letters then they
are anagrams

Anagram is the class, we initialize an object with a single
string

the method invocation that looks for anagrams can be passed
an indeterminite number of arguments

class Anagram
  def initialize(word)
    @word = word
  end

  def match(*arguments)
    arr = delete_same(arguments.flatten)
    return 'No words to compare.' if arr.empty?
  
    arr.select { |ex| anagram?(ex, word) }
  end

  private

  attr_reader :word 

  def sort_str(str)
    str.split('').sort
  end

  def anagram?(str1, str2)
    sort_str(str1.downcase) == sort_str(str2.downcase)
  end

  def delete_same(strings)
    rejects = strings.select { |word| strings.map(&:downcase).count(word) > 1 }
    strings.reject { |word| rejects.include?(word.downcase) }
  end
end

=end

class Anagram
  def initialize(word)
    @word = word
  end

  def match(*arguments)
    arr = arguments.flatten
    return 'No words to compare.' if arr.empty?
    
    arr.select { |ex| anagram?(ex, word) }
  end

  private

  attr_reader :word 

  def word_hsh(str)
    hsh = {}
    
    str.each_char { |char| hsh[char] ? hsh[char] += 1 : hsh[char] = 1 }

    hsh
  end

  def anagram?(str1, str2)
    return false if str1.downcase == str2.downcase
    word_hsh(str1.downcase) == word_hsh(str2.downcase)
  end
end

# detector = Anagram.new('corn')
# p detector.match %w(corn dark Corn rank CORN cron park)

# detector1 = Anagram.new('Orchestra')
# p detector1.match %w(cashregister Carthorse radishes)