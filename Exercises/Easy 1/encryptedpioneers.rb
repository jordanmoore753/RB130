=begin 

input =

output =

rules =

algorithm =

=end

def decipher(str)
  arr, results = str.split(' '), ''
  double_letters = ('a'..'z').to_a * 2

  arr.each do |word|
    word.each_char do |char|
      if char == '-'
        results += '-'
        next
      end

      char_idx = double_letters.index(char.downcase) + 13
      results += double_letters[char_idx]
    end

    results += ' '
  end

  results.split(' ').map(&:capitalize!).join(' ')
end

names = <<~HEREDOC
        Nqn Ybirynpr
        Tenpr Ubccre
        Nqryr Tbyqfgvar
        Nyna Ghevat
        Puneyrf Onoontr
        Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
        Wbua Ngnanfbss
        Ybvf Unvog
        Pynhqr Funaaba
        Fgrir Wbof
        Ovyy Tngrf
        Gvz Orearef-Yrr
        Fgrir Jbmavnx
        Xbaenq Mhfr
        Fve Nagbal Ubner
        Zneiva Zvafxl
        Lhxvuveb Zngfhzbgb
        Unllvz Fybavzfxv
        Tregehqr Oynapu
        HEREDOC


p decipher(names)
# p decipher('Tenpr Ubccre')
# p decipher('Nqryr Tbyqfgvar')
# p decipher('Nyna Ghevat')
# p decipher('Puneyrf Onoontr')