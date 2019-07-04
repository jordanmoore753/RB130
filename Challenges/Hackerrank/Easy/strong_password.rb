def minimumNumber(n, password)
  length = 6
  valid_characters = []
  digits, specials = 0, 0
  lowers, uppers = 0, 0
  missing_chars = 0
  special_chars = %w(! @ # $ % ^ & * ( ) - +)

  password.chars.each do |char|
    case 
    when ('a'..'z').to_a.include?(char) then lowers += 1
    when ('A'..'Z').to_a.include?(char) then uppers += 1
    when ('0'..'9').to_a.include?(char) then digits += 1
    when special_chars.include?(char) then specials += 1
    end
  end

  result = length - password.length
  [digits, specials, lowers, uppers].each do |num| 
    missing_chars += 1 if num.zero?
  end
  
  if missing_chars > 0 || result > 0
    if missing_chars > result
      return missing_chars 
    else 
      return result
    end
  end

  0
end

p minimumNumber(3, "Ab1")
p minimumNumber(11, "#HackerRank")
p minimumNumber(4, '4700')