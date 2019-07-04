def marsExploration(s)
  sub_arrs = s.chars.each_slice(3).to_a
  missing_chars = 0

  sub_arrs.each do |sub|
    sub.each_with_index do |ele, idx|
      if idx.zero? && ele == 'S'
        next
      elsif idx == 1 && ele == 'O'
        next
      elsif idx == 2 && ele == 'S'
        next
      else
        missing_chars += 1
      end
    end 
  end

  missing_chars
end

a = "SOSSPSSQSSOR"
b = "SOSOOSOSOSOSOSSOSOSOSOSOSOS"
p marsExploration(b)

