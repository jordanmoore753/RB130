=begin 

caesar cipher shifts each letter by a number of letters

if the shift is 2, then a => c, e => g

given the integer for shift, adjust the alphabet array by starting it from
the shift integer, and then append the sliced array of alphabet upto but not 
including the shift integer

this step will create the caesar array

so we have a normal alphabet and a modified alphabet

ignore anything that isn't a letter

uppercase and lowercase do matter

for each letter in the unencrypted string, if it is a letter,
	replace it with its index equivalent in the caesar array

find the index of the current letter in the original array
gsub the current letter with the element at position (index) in caesar array

=end

def caesarCipher(s, k)
	orig_alph_low = ('a'..'z').to_a
	orig_alph_upp = ('A'..'Z').to_a

	if k >= 26
		num = k % 26
		caesar_alph_low = orig_alph_low[num..-1] + orig_alph_low[0...num]
		caesar_alph_upp = orig_alph_upp[num..-1] + orig_alph_upp[0...num]		
	else
		caesar_alph_low = orig_alph_low[k..-1] + orig_alph_low[0...k]
		caesar_alph_upp = orig_alph_upp[k..-1] + orig_alph_upp[0...k]
	end

	orig_alph = orig_alph_low + orig_alph_upp
	caesar_alph = caesar_alph_low + caesar_alph_upp
	
	s.chars.map do |char|
		if orig_alph.include?(char)
			idx = orig_alph.index(char)
			caesar_alph[idx]
		else
			char
		end
	end.join
end

#p caesarCipher('middle-Outz', 2)
p caesarCipher('Always-Look-on-the-Bright-Side-of-Life', 5)
