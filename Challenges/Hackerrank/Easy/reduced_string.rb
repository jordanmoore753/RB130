def superReducedString(s)
  characters = ('a'..'z').to_a.map { |char| char + char }

  10.times do 
    characters.each do |pair| 
      if s.include?(pair)
        s.gsub!(pair, "")
      end
    end
  end

  s == "" ? "Empty String" : s
end

a = "aaabccddd"
p superReducedString(a)

