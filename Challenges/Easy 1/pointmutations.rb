=begin 

problem: find the difference (letters in array)
between two strands of DNA

this is called the Hamming distance: the letters
that differ between two strands of DNA

GAGCCT
CATCGT

the hamming distance is: C, T, G because those are the different
letters

an array would work best

iterating over the second array of letters and selecting the letters
that are NOT the same as the equivalent index in the first array

the iteration only lasts as long as the first array
is long

strand_one.select.with_index { |char, idx| char != dna_two[idx] }.join('').length

=end

class DNA
  def initialize(str)
    @strand_one = str.split('')
  end

  def hamming_distance(input)
    dna_two = input.split('')
    stop_point, idx = strand_one.size - 1, 0
    result = []

    until idx > stop_point
      break if strand_one[idx].nil?
      
      result << dna_two[idx] if dna_two[idx] != strand_one[idx]
      idx += 1
    end

    result.join('').length
  end

  private

  attr_reader :strand_one
end

# me = DNA.new('GAGCCT')
# p me.hamming_distance('CATCGT')
# strand = 'GGACGGATTCTGACCTGGACTAATTTTGGGG'
# distance = 'AGGACGGATTCTGACCTGGACTAATTTTGGGG'
# second = DNA.new(strand)
# p second.hamming_distance(distance)
